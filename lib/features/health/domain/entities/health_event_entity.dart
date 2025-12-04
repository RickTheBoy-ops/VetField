import 'package:freezed_annotation/freezed_annotation.dart';

part 'health_event_entity.freezed.dart';
part 'health_event_entity.g.dart';

enum HealthEventType { vaccine, exam, consultation, surgery, prescription }

@freezed
class HealthEventEntity with _$HealthEventEntity {
  const factory HealthEventEntity({
    required String id,
    required String ownerId,
    String? petId,
    required HealthEventType type,
    required DateTime date,
    String? details,
    String? vetId,
    String? attachmentUrl,
  }) = _HealthEventEntity;

  factory HealthEventEntity.fromJson(Map<String, dynamic> json) => _$HealthEventEntityFromJson(json);
}

