import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../domain/entities/social_pet_entity.dart';

class SocialPetModel extends SocialPet {
  const SocialPetModel({
    required super.id,
    required super.name,
    required super.breed,
    super.photoUrl,
    super.distanceKm,
    required super.isOnline,
    required super.ownerId,
    super.ownerName,
    super.checkInMessage,
    super.location,
  });

  factory SocialPetModel.fromJson(Map<String, dynamic> json) {
    LatLng? location;
    if (json['latitude'] != null && json['longitude'] != null) {
      location = LatLng(
        (json['latitude'] as num).toDouble(),
        (json['longitude'] as num).toDouble(),
      );
    }

    return SocialPetModel(
      id: json['id'] as String,
      name: json['name'] as String,
      breed: json['breed'] as String? ?? 'Raça Desconhecida',
      photoUrl: json['photo_url'] as String?,
      distanceKm: json['distance_km'] != null 
          ? (json['distance_km'] as num).toDouble() 
          : null,
      isOnline: json['is_online'] as bool? ?? false,
      ownerId: json['owner_id'] as String,
      ownerName: json['owner_name'] as String?,
      checkInMessage: json['check_in_message'] as String?,
      location: location,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'breed': breed,
        'photo_url': photoUrl,
        'distance_km': distanceKm,
        'is_online': isOnline,
        'owner_id': ownerId,
        'owner_name': ownerName,
        'check_in_message': checkInMessage,
        'latitude': location?.latitude,
        'longitude': location?.longitude,
      };
}
