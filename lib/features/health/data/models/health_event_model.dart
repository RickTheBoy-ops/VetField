import '../../domain/entities/health_event_entity.dart';

class HealthEventModel extends HealthEventEntity {
  const HealthEventModel({
    required super.id,
    required super.ownerId,
    super.petId,
    required super.type,
    required super.date,
    super.details,
    super.vetId,
    super.attachmentUrl,
  });

  factory HealthEventModel.fromJson(Map<String, dynamic> json) {
    return HealthEventModel(
      id: json['id'] as String,
      ownerId: json['owner_id'] as String,
      petId: json['pet_id'] as String?,
      type: _parseType(json['type'] as String),
      date: DateTime.parse(json['date'] as String),
      details: json['details'] as String?,
      vetId: json['vet_id'] as String?,
      attachmentUrl: json['attachment_url'] as String?,
    );
  }

  static HealthEventType _parseType(String t) {
    switch (t) {
      case 'vaccine': return HealthEventType.vaccine;
      case 'exam': return HealthEventType.exam;
      case 'consultation': return HealthEventType.consultation;
      case 'surgery': return HealthEventType.surgery;
      default: return HealthEventType.consultation;
    }
  }
}
