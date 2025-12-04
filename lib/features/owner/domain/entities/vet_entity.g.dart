// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vet_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VetEntityImpl _$$VetEntityImplFromJson(Map<String, dynamic> json) =>
    _$VetEntityImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      specialty: json['specialty'] as String,
      address: json['address'] as String,
      rating: (json['rating'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      avatarUrl: json['avatarUrl'] as String,
      price: (json['price'] as num).toDouble(),
      isAvailable: json['isAvailable'] as bool? ?? true,
    );

Map<String, dynamic> _$$VetEntityImplToJson(_$VetEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'specialty': instance.specialty,
      'address': instance.address,
      'rating': instance.rating,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'avatarUrl': instance.avatarUrl,
      'price': instance.price,
      'isAvailable': instance.isAvailable,
    };
