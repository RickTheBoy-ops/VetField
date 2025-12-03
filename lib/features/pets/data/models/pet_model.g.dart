// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PetModelImpl _$$PetModelImplFromJson(Map<String, dynamic> json) =>
    _$PetModelImpl(
      id: json['id'] as String,
      ownerId: json['owner_id'] as String,
      name: json['name'] as String,
      breed: json['breed'] as String?,
      species: $enumDecode(_$PetSpeciesEnumMap, json['species']),
      gender: $enumDecodeNullable(_$PetGenderEnumMap, json['gender']),
      birthDate: json['birth_date'] == null
          ? null
          : DateTime.parse(json['birth_date'] as String),
      weight: (json['weight'] as num?)?.toDouble(),
      photoUrl: json['photo_url'] as String?,
    );

Map<String, dynamic> _$$PetModelImplToJson(_$PetModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner_id': instance.ownerId,
      'name': instance.name,
      'breed': instance.breed,
      'species': _$PetSpeciesEnumMap[instance.species]!,
      'gender': _$PetGenderEnumMap[instance.gender],
      'birth_date': instance.birthDate?.toIso8601String(),
      'weight': instance.weight,
      'photo_url': instance.photoUrl,
    };

const _$PetSpeciesEnumMap = {
  PetSpecies.dog: 'dog',
  PetSpecies.cat: 'cat',
};

const _$PetGenderEnumMap = {
  PetGender.male: 'male',
  PetGender.female: 'female',
};
