import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SocialPet extends Equatable {
  final String id;
  final String name;
  final String breed;
  final String? photoUrl;
  final double? distanceKm;
  final bool isOnline;
  final String ownerId;
  final String? ownerName;
  final String? checkInMessage;
  final LatLng? location;

  const SocialPet({
    required this.id,
    required this.name,
    required this.breed,
    this.photoUrl,
    this.distanceKm,
    required this.isOnline,
    required this.ownerId,
    this.ownerName,
    this.checkInMessage,
    this.location,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        breed,
        photoUrl,
        distanceKm,
        isOnline,
        ownerId,
        ownerName,
        checkInMessage,
        location,
      ];
}
