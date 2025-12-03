import 'package:equatable/equatable.dart';

class VetEntity extends Equatable {
  final String id;
  final String name;
  final String specialty;
  final String address;
  final double rating;
  final double latitude;
  final double longitude;
  final String avatarUrl;
  final double price;
  final bool isAvailable;

  const VetEntity({
    required this.id,
    required this.name,
    required this.specialty,
    required this.address,
    required this.rating,
    required this.latitude,
    required this.longitude,
    required this.avatarUrl,
    required this.price,
    this.isAvailable = true,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        specialty,
        address,
        rating,
        latitude,
        longitude,
        avatarUrl,
        price,
        isAvailable,
      ];
}
