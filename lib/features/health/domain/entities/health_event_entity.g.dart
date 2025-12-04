// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_event_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HealthEventEntityImpl _$$HealthEventEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$HealthEventEntityImpl(
      id: json['id'] as String,
      ownerId: json['ownerId'] as String,
      petId: json['petId'] as String?,
      type: $enumDecode(_$HealthEventTypeEnumMap, json['type']),
      date: DateTime.parse(json['date'] as String),
      details: json['details'] as String?,
      vetId: json['vetId'] as String?,
      attachmentUrl: json['attachmentUrl'] as String?,
    );

Map<String, dynamic> _$$HealthEventEntityImplToJson(
        _$HealthEventEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ownerId': instance.ownerId,
      'petId': instance.petId,
      'type': _$HealthEventTypeEnumMap[instance.type]!,
      'date': instance.date.toIso8601String(),
      'details': instance.details,
      'vetId': instance.vetId,
      'attachmentUrl': instance.attachmentUrl,
    };

const _$HealthEventTypeEnumMap = {
  HealthEventType.vaccine: 'vaccine',
  HealthEventType.exam: 'exam',
  HealthEventType.consultation: 'consultation',
  HealthEventType.surgery: 'surgery',
  HealthEventType.prescription: 'prescription',
};
