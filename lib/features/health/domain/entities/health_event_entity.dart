import 'package:equatable/equatable.dart';

enum HealthEventType { vaccine, exam, consultation, surgery }

class HealthEventEntity extends Equatable {
  final String id;
  final String ownerId;
  final String? petId;
  final HealthEventType type;
  final DateTime date;
  final String? details;
  final String? vetId;
  final String? attachmentUrl;

  const HealthEventEntity({
    required this.id,
    required this.ownerId,
    this.petId,
    required this.type,
    required this.date,
    this.details,
    this.vetId,
    this.attachmentUrl,
  });

  @override
  List<Object?> get props => [id, ownerId, petId, type, date, details, vetId, attachmentUrl];
}
