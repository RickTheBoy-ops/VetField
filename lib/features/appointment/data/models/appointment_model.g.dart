// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppointmentModelAdapter extends TypeAdapter<AppointmentModel> {
  @override
  final int typeId = 0;

  @override
  AppointmentModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppointmentModel(
      id: fields[5] as String,
      ownerId: fields[0] as String,
      vetId: fields[1] as String,
      petId: fields[4] as String?,
      petName: fields[2] as String,
      dateTime: fields[3] as DateTime,
      status: fields[8] as AppointmentStatus,
      type: fields[9] as AppointmentType,
      notes: fields[10] as String?,
      price: fields[11] as double,
      vetName: fields[6] as String?,
      ownerName: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AppointmentModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(5)
      ..write(obj.id)
      ..writeByte(0)
      ..write(obj.ownerId)
      ..writeByte(1)
      ..write(obj.vetId)
      ..writeByte(4)
      ..write(obj.petId)
      ..writeByte(2)
      ..write(obj.petName)
      ..writeByte(3)
      ..write(obj.dateTime)
      ..writeByte(6)
      ..write(obj.vetName)
      ..writeByte(7)
      ..write(obj.ownerName)
      ..writeByte(8)
      ..write(obj.status)
      ..writeByte(9)
      ..write(obj.type)
      ..writeByte(10)
      ..write(obj.notes)
      ..writeByte(11)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppointmentModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
