import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import '../../../../core/providers/supabase_provider.dart';
import '../../data/datasources/social_remote_datasource.dart';
import '../../data/repositories/social_repository_impl.dart';
import '../../domain/repositories/social_repository.dart';
import '../../domain/entities/social_pet_entity.dart';
 

part 'social_provider.g.dart';

// Data Sources
@riverpod
SocialRemoteDataSource socialRemoteDataSource(Ref ref) {
  final supabaseClient = ref.watch(supabaseClientProvider);
  return SocialRemoteDataSourceImpl(supabaseClient);
}

// Repositories
@riverpod
SocialRepository socialRepository(Ref ref) {
  final remoteDataSource = ref.watch(socialRemoteDataSourceProvider);
  return SocialRepositoryImpl(remoteDataSource: remoteDataSource);
}

// Social Controller
@riverpod
class SocialController extends _$SocialController {
  Position? _currentPosition;
  bool _isCheckedIn = false;

  @override
  FutureOr<List<SocialPet>> build() async {
    return [];
  }

  bool get isCheckedIn => _isCheckedIn;

  Future<void> checkIn() async {
    state = const AsyncValue.loading();
    
    try {
      // Get current location
      final position = await _getCurrentLocation();
      _currentPosition = position;

      // Call repository to check in
      final user = ref.read(supabaseClientProvider).auth.currentUser;
      if (user != null) {
        final repository = ref.read(socialRepositoryProvider);
        await repository.checkIn(
          latitude: position.latitude,
          longitude: position.longitude,
        );
        
        _isCheckedIn = true;
        
        // Fetch nearby pets
        await fetchNearby();
      }
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> fetchNearby() async {
    if (_currentPosition == null) {
      state = AsyncValue.error('Localização não disponível', StackTrace.current);
      return;
    }

    state = const AsyncValue.loading();
    
    try {
      final repository = ref.read(socialRepositoryProvider);
      final result = await repository.getNearbyPets(
        latitude: _currentPosition!.latitude,
        longitude: _currentPosition!.longitude,
        radiusKm: 2.0,
      );

      result.fold(
        (failure) => state = AsyncValue.error(failure.message, StackTrace.current),
        (pets) => state = AsyncValue.data(pets),
      );
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> checkOut() async {
    try {
      final user = ref.read(supabaseClientProvider).auth.currentUser;
      if (user != null) {
        final repository = ref.read(socialRepositoryProvider);
        await repository.checkOut();
        _isCheckedIn = false;
        _currentPosition = null;
        state = const AsyncValue.data([]);
      }
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Serviço de localização desabilitado');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Permissão de localização negada');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Permissão de localização negada permanentemente');
    }

    return await Geolocator.getCurrentPosition();
  }
}
