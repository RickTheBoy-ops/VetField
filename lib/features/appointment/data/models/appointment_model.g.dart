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
      petId: json['pet_id'] as String?,
      petName: json['pet_name'] as String,
      dateTime: AppointmentModel._fromIso(json['date_time'] as String),
      status: $enumDecode(_$AppointmentStatusEnumMap, json['status']),
      type: $enumDecode(_$AppointmentTypeEnumMap, json['type']),
      notes: json['notes'] as String?,
      price: (json['price'] as num).toDouble(),
      vetName: json['vet_name'] as String?,
      ownerName: json['owner_name'] as String?,
      petPhotoUrl: json['pet_photo_url'] as String?,
      petSpecies: json['pet_species'] as String?,
      petBreed: json['pet_breed'] as String?,
    );

Map<String, dynamic> _$AppointmentModelToJson(AppointmentModel instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'owner_id': instance.ownerId,
    'vet_id': instance.vetId,
    'pet_id': instance.petId,
    'pet_name': instance.petName,
    'date_time': AppointmentModel._toIso(instance.dateTime),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('vet_name', instance.vetName);
  writeNotNull('owner_name', instance.ownerName);
  writeNotNull('pet_photo_url', instance.petPhotoUrl);
  writeNotNull('pet_species', instance.petSpecies);
  writeNotNull('pet_breed', instance.petBreed);
  val['status'] = _$AppointmentStatusEnumMap[instance.status]!;
  val['type'] = _$AppointmentTypeEnumMap[instance.type]!;
  val['notes'] = instance.notes;
  val['price'] = instance.price;
  return val;
}

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
