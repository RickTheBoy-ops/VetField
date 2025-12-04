import 'package:freezed_annotation/freezed_annotation.dart';

part 'vet_entity.freezed.dart';
part 'vet_entity.g.dart';

@freezed
class VetEntity with _$VetEntity {
  const factory VetEntity({
    required String id,
    required String name,
    required String specialty,
    required String address,
    required double rating,
    required double latitude,
    required double longitude,
    required String avatarUrl,
    required double price,
    @Default(true) bool isAvailable,
  }) = _VetEntity;

  factory VetEntity.fromJson(Map<String, dynamic> json) => _$VetEntityFromJson(json);
}

