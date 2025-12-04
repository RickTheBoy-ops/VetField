import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'social_pet_entity.freezed.dart';
part 'social_pet_entity.g.dart';

@freezed
class SocialPet with _$SocialPet {
  const factory SocialPet({
    required String id,
    required String name,
    required String breed,
    String? photoUrl,
    double? distanceKm,
    required bool isOnline,
    required String ownerId,
    String? ownerName,
    String? checkInMessage,
    @JsonKey(includeFromJson: false, includeToJson: false) LatLng? location,
  }) = _SocialPet;

  factory SocialPet.fromJson(Map<String, dynamic> json) => _$SocialPetFromJson(json);
}

