// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_pet_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SocialPetImpl _$$SocialPetImplFromJson(Map<String, dynamic> json) =>
    _$SocialPetImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      breed: json['breed'] as String,
      photoUrl: json['photoUrl'] as String?,
      distanceKm: (json['distanceKm'] as num?)?.toDouble(),
      isOnline: json['isOnline'] as bool,
      ownerId: json['ownerId'] as String,
      ownerName: json['ownerName'] as String?,
      checkInMessage: json['checkInMessage'] as String?,
    );

Map<String, dynamic> _$$SocialPetImplToJson(_$SocialPetImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'breed': instance.breed,
      'photoUrl': instance.photoUrl,
      'distanceKm': instance.distanceKm,
      'isOnline': instance.isOnline,
      'ownerId': instance.ownerId,
      'ownerName': instance.ownerName,
      'checkInMessage': instance.checkInMessage,
    };
