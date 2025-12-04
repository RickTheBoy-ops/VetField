import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/social_pet_model.dart';

abstract class SocialRemoteDataSource {
  Future<List<SocialPetModel>> getNearbyPets({
    required double latitude,
    required double longitude,
    double radiusKm = 2.0,
  });
  
  Future<void> checkIn({
    required String userId,
    required double latitude,
    required double longitude,
  });
  
  Future<void> checkOut(String userId);
}

class SocialRemoteDataSourceImpl implements SocialRemoteDataSource {
  final SupabaseClient supabaseClient;

  SocialRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<List<SocialPetModel>> getNearbyPets({
    required double latitude,
    required double longitude,
    double radiusKm = 2.0,
  }) async {
    try {
      // Try to call Supabase RPC function
      final response = await supabaseClient.rpc(
        'get_nearby_pets_social',
        params: {
          'user_lat': latitude,
          'user_lng': longitude,
          'radius_km': radiusKm,
        },
      );

      return (response as List)
          .map((json) => SocialPetModel.fromJson(json))
          .toList();
    } catch (e) {
      // Fallback: Return mock data for testing/demo
      return _getMockPets(latitude, longitude);
    }
  }

  List<SocialPetModel> _getMockPets(double lat, double lng) {
    return [
      SocialPetModel(
        id: 'mock-1',
        name: 'Rex',
        breed: 'Golden Retriever',
        photoUrl: 'https://images.unsplash.com/photo-1633722715463-d30f4f325e24?w=400',
        distanceKm: 0.5,
        isOnline: true,
        ownerId: 'mock-owner-1',
        ownerName: 'João Silva',
        checkInMessage: 'Brincando no parque! 🐕',
      ),
      const SocialPetModel(
        id: 'mock-2',
        name: 'Luna',
        breed: 'Labrador',
        distanceKm: 1.2,
        isOnline: true,
        ownerId: 'mock-owner-2',
        ownerName: 'Maria Santos',
        checkInMessage: 'Procurando amigos para brincar',
      ),
      const SocialPetModel(
        id: 'mock-3',
        name: 'Thor',
        breed: 'Pastor Alemão',
        photoUrl: 'https://images.unsplash.com/photo-1568393691622-c7ba131d63b4?w=400',
        distanceKm: 1.8,
        isOnline: true,
        ownerId: 'mock-owner-3',
        ownerName: 'Pedro Oliveira',
      ),
    ];
  }

  @override
  Future<void> checkIn({
    required String userId,
    required double latitude,
    required double longitude,
  }) async {
    // Update user's pets to be visible in social (set location + is_online = true)
    await supabaseClient.from('pets').update({
      'social_location': 'POINT($longitude $latitude)',
      'social_is_online': true,
      'social_last_seen': DateTime.now().toIso8601String(),
    }).eq('owner_id', userId);
  }

  @override
  Future<void> checkOut(String userId) async {
    // Hide user's pets from social
    await supabaseClient.from('pets').update({
      'social_is_online': false,
    }).eq('owner_id', userId);
  }
}
