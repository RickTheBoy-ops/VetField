// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PetModelImpl _$$PetModelImplFromJson(Map<String, dynamic> json) =>
    _$PetModelImpl(
      id: json['id'] as String,
      ownerId: json['ownerId'] as String,
      name: json['name'] as String,
      breed: json['breed'] as String?,
      species: $enumDecode(_$PetSpeciesEnumMap, json['species']),
      gender: $enumDecodeNullable(_$PetGenderEnumMap, json['gender']),
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      weight: (json['weight'] as num?)?.toDouble(),
      photoUrl: json['photoUrl'] as String?,
    );

Map<String, dynamic> _$$PetModelImplToJson(_$PetModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ownerId': instance.ownerId,
      'name': instance.name,
      'breed': instance.breed,
      'species': _$PetSpeciesEnumMap[instance.species]!,
      'gender': _$PetGenderEnumMap[instance.gender],
      'birthDate': instance.birthDate?.toIso8601String(),
      'weight': instance.weight,
      'photoUrl': instance.photoUrl,
    };

const _$PetSpeciesEnumMap = {PetSpecies.dog: 'dog', PetSpecies.cat: 'cat'};

const _$PetGenderEnumMap = {PetGender.male: 'male', PetGender.female: 'female'};
