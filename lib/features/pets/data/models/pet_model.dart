import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/pet_entity.dart';

part 'pet_model.freezed.dart';
part 'pet_model.g.dart';

@freezed
class PetModel with _$PetModel {
  const PetModel._();
  const factory PetModel({
    required String id,
    @JsonKey(name: 'owner_id') required String ownerId,
    required String name,
    String? breed,
    required PetSpecies species,
    PetGender? gender,
    @JsonKey(name: 'birth_date') DateTime? birthDate,
    double? weight,
    @JsonKey(name: 'photo_url') String? photoUrl,
  }) = _PetModel;

  factory PetModel.fromJson(Map<String, dynamic> json) =>
      _$PetModelFromJson(json);

  factory PetModel.fromEntity(PetEntity e) => PetModel(
    id: e.id,
    ownerId: e.ownerId,
    name: e.name,
    breed: e.breed,
    species: e.species,
    gender: e.gender,
    birthDate: e.birthDate,
    weight: e.weight,
    photoUrl: e.photoUrl,
  );
}

extension PetModelX on PetModel {
  PetEntity toEntity() => PetEntity(
    id: this.id,
    ownerId: this.ownerId,
    name: this.name,
    breed: this.breed,
    species: this.species,
    gender: this.gender,
    birthDate: this.birthDate,
    weight: this.weight,
    photoUrl: this.photoUrl,
  );
}
