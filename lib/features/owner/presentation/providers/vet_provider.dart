import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/supabase_provider.dart';
import '../../data/datasources/vet_remote_datasource.dart';
import '../../data/datasources/owner_local_datasource.dart';
import '../../data/repositories/vet_repository_impl.dart';
import '../../domain/entities/vet_entity.dart';
import '../../domain/repositories/vet_repository.dart';
import '../../domain/usecases/get_nearby_vets_usecase.dart';
import '../../domain/usecases/get_sos_nearest_vet_usecase.dart';

part 'vet_provider.g.dart';

@Riverpod(keepAlive: true)
VetRemoteDataSource vetRemoteDataSource(Ref ref) {
  final supabaseClient = ref.watch(supabaseClientProvider);
  return VetRemoteDataSourceImpl(supabaseClient);
}

@Riverpod(keepAlive: true)
OwnerLocalDataSource ownerLocalDataSource(Ref ref) {
  return OwnerLocalDataSourceImpl();
}

@Riverpod(keepAlive: true)
VetRepository vetRepository(Ref ref) {
  final remoteDataSource = ref.watch(vetRemoteDataSourceProvider);
  final localDataSource = ref.watch(ownerLocalDataSourceProvider);
  return VetRepositoryImpl(
    remoteDataSource: remoteDataSource,
    localDataSource: localDataSource,
  );
}

@Riverpod(keepAlive: true)
GetNearbyVetsUseCase getNearbyVetsUseCase(Ref ref) {
  final repository = ref.watch(vetRepositoryProvider);
  return GetNearbyVetsUseCase(repository);
}

@Riverpod(keepAlive: true)
GetSosNearestVetUseCase getSosNearestVetUseCase(Ref ref) {
  final repository = ref.watch(vetRepositoryProvider);
  return GetSosNearestVetUseCase(repository);
}

@Riverpod(keepAlive: true)
class NearbyVetsController extends _$NearbyVetsController {
  @override
  FutureOr<List<VetEntity>> build() {
    return [];
  }

  Future<void> fetchNearbyVets({
    required double lat,
    required double lng,
    double radius = 10.0,
  }) async {
    state = const AsyncValue.loading();

    final useCase = ref.read(getNearbyVetsUseCaseProvider);
    final result = await useCase(
      GetNearbyVetsParams(latitude: lat, longitude: lng, radiusKm: radius),
    );

    result.fold(
      (failure) =>
          state = AsyncValue.error(failure.message, StackTrace.current),
      (vets) => state = AsyncValue.data(vets),
    );
  }
}

@Riverpod(keepAlive: true)
class SearchVetsController extends _$SearchVetsController {
  @override
  FutureOr<List<VetEntity>> build() {
    return [];
  }

  Future<void> search({
    String? query,
    String? specialty,
    double? maxPrice,
    double? minRating,
    double? lat,
    double? lng,
    double? radiusKm,
  }) async {
    state = const AsyncValue.loading();
    final repository = ref.read(vetRepositoryProvider);
    final result = await repository.searchVets(
      query: query,
      specialty: specialty,
      maxPrice: maxPrice,
      minRating: minRating,
      lat: lat,
      lng: lng,
      radiusKm: radiusKm,
    );
    result.fold(
      (failure) =>
          state = AsyncValue.error(failure.message, StackTrace.current),
      (vets) => state = AsyncValue.data(vets),
    );
  }
}

@Riverpod(keepAlive: true)
class SosNearestVetController extends _$SosNearestVetController {
  @override
  FutureOr<VetEntity?> build() {
    return null;
  }

  Future<void> fetch({required double lat, required double lng}) async {
    state = const AsyncValue.loading();
    final useCase = ref.read(getSosNearestVetUseCaseProvider);
    final result = await useCase(
      GetSosNearestVetParams(latitude: lat, longitude: lng),
    );
    result.fold(
      (failure) =>
          state = AsyncValue.error(failure.message, StackTrace.current),
      (vet) => state = AsyncValue.data(vet),
    );
  }
}
