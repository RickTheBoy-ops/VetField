import 'package:freezed_annotation/freezed_annotation.dart';

part 'pet_entity.freezed.dart';

enum PetSpecies { dog, cat }
enum PetGender { male, female }

@freezed
class PetEntity with _$PetEntity {
  const factory PetEntity({
    required String id,
    required String ownerId,
    required String name,
    String? breed,
    required PetSpecies species,
    PetGender? gender,
    DateTime? birthDate,
    double? weight,
    String? photoUrl,
  }) = _PetEntity;
}

