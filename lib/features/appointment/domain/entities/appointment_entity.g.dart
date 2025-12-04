// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppointmentEntityImpl _$$AppointmentEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$AppointmentEntityImpl(
      id: json['id'] as String,
      ownerId: json['ownerId'] as String,
      vetId: json['vetId'] as String,
      petId: json['petId'] as String?,
      petName: json['petName'] as String,
      dateTime: DateTime.parse(json['dateTime'] as String),
      status: $enumDecode(_$AppointmentStatusEnumMap, json['status']),
      type: $enumDecode(_$AppointmentTypeEnumMap, json['type']),
      notes: json['notes'] as String?,
      price: (json['price'] as num).toDouble(),
      vetName: json['vetName'] as String?,
      ownerName: json['ownerName'] as String?,
      petPhotoUrl: json['petPhotoUrl'] as String?,
      petSpecies: json['petSpecies'] as String?,
      petBreed: json['petBreed'] as String?,
    );

Map<String, dynamic> _$$AppointmentEntityImplToJson(
        _$AppointmentEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ownerId': instance.ownerId,
      'vetId': instance.vetId,
      'petId': instance.petId,
      'petName': instance.petName,
      'dateTime': instance.dateTime.toIso8601String(),
      'status': _$AppointmentStatusEnumMap[instance.status]!,
      'type': _$AppointmentTypeEnumMap[instance.type]!,
      'notes': instance.notes,
      'price': instance.price,
      'vetName': instance.vetName,
      'ownerName': instance.ownerName,
      'petPhotoUrl': instance.petPhotoUrl,
      'petSpecies': instance.petSpecies,
      'petBreed': instance.petBreed,
    };

const _$AppointmentStatusEnumMap = {
  AppointmentStatus.pending: 'pending',
  AppointmentStatus.confirmed: 'confirmed',
  AppointmentStatus.completed: 'completed',
  AppointmentStatus.cancelled: 'cancelled',
};

const _$AppointmentTypeEnumMap = {
  AppointmentType.consultation: 'consultation',
  AppointmentType.vaccine: 'vaccine',
  AppointmentType.exam: 'exam',
  AppointmentType.surgery: 'surgery',
};
