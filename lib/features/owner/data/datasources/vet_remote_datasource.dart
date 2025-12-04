import 'package:supabase_flutter/supabase_flutter.dart';
import '../../domain/entities/vet_entity.dart';

abstract class VetRemoteDataSource {
  Future<List<VetEntity>> getNearbyVets(double lat, double lng, double radiusKm);
  Future<List<VetEntity>> searchVets({String? query, String? specialty, double? maxPrice, double? minRating, double? lat, double? lng, double? radiusKm});
  Future<VetEntity?> getSosNearestVet(double lat, double lng);
}

class VetRemoteDataSourceImpl implements VetRemoteDataSource {
  final SupabaseClient supabaseClient;

  VetRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<List<VetEntity>> getNearbyVets(double lat, double lng, double radiusKm) async {
    // Chamada RPC para função PostGIS no Supabase
    final List<dynamic> response = await supabaseClient.rpc(
      'nearby_vets',
      params: {
        'lat': lat,
        'long': lng,
        'radius_km': radiusKm,
      },
    );

    return response.map((json) => VetEntity.fromJson(json)).toList();
  }

  @override
  Future<List<VetEntity>> searchVets({String? query, String? specialty, double? maxPrice, double? minRating, double? lat, double? lng, double? radiusKm}) async {
    if (lat != null && lng != null && radiusKm != null) {
      final List<dynamic> nearby = await supabaseClient.rpc(
        'nearby_vets',
        params: {
          'lat': lat,
          'long': lng,
          'radius_km': radiusKm,
        },
      );
      var vets = nearby.map((json) => VetEntity.fromJson(json as Map<String, dynamic>)).toList();
      if (query != null && query.isNotEmpty) {
        vets = vets.where((v) => v.name.toLowerCase().contains(query.toLowerCase())).toList();
      }
      if (specialty != null) {
        vets = vets.where((v) => v.specialty == specialty).toList();
      }
      if (maxPrice != null) {
        vets = vets.where((v) => v.price <= maxPrice).toList();
      }
      if (minRating != null) {
        vets = vets.where((v) => v.rating >= minRating).toList();
      }
      return vets;
    }

    var queryBuilder = supabaseClient.from('vets').select();

    if (query != null && query.isNotEmpty) {
      queryBuilder = queryBuilder.ilike('name', '%$query%');
    }
    
    if (specialty != null) {
      queryBuilder = queryBuilder.eq('specialty', specialty);
    }

    if (maxPrice != null) {
      queryBuilder = queryBuilder.lte('price', maxPrice);
    }

    if (minRating != null) {
      queryBuilder = queryBuilder.gte('rating', minRating);
    }

    final response = await queryBuilder;
    return (response as List).map((json) => VetEntity.fromJson(json)).toList();
  }

  @override
  Future<VetEntity?> getSosNearestVet(double lat, double lng) async {
    final dynamic response = await supabaseClient.rpc(
      'sos_nearest_vet',
      params: {
        'lat': lat,
        'long': lng,
      },
    );
    if (response == null) return null;
    if (response is List && response.isNotEmpty) {
      return VetEntity.fromJson(response.first as Map<String, dynamic>);
    }
    if (response is Map<String, dynamic>) {
      return VetEntity.fromJson(response);
    }
    return null;
  }
}

