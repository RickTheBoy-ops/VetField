// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentModel _$AppointmentModelFromJson(Map<String, dynamic> json) =>
    AppointmentModel(
      id: json['id'] as String,
      ownerId: json['owner_id'] as String,
      vetId: json['vet_id'] as String,
      petName: json['pet_name'] as String,
      dateTime: AppointmentModel._fromIso(json['date_time'] as String),
      status: $enumDecode(_$AppointmentStatusEnumMap, json['status']),
      type: $enumDecode(_$AppointmentTypeEnumMap, json['type']),
      notes: json['notes'] as String?,
      price: (json['price'] as num).toDouble(),
      vetName: json['vet_name'] as String?,
      ownerName: json['owner_name'] as String?,
    );

Map<String, dynamic> _$AppointmentModelToJson(AppointmentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': _$AppointmentStatusEnumMap[instance.status]!,
      'type': _$AppointmentTypeEnumMap[instance.type]!,
      'notes': instance.notes,
      'price': instance.price,
      'owner_id': instance.ownerId,
      'vet_id': instance.vetId,
      'pet_name': instance.petName,
      'date_time': AppointmentModel._toIso(instance.dateTime),
      if (instance.vetName case final value?) 'vet_name': value,
      if (instance.ownerName case final value?) 'owner_name': value,
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
