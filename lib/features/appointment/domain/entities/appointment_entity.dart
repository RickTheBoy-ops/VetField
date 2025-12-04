import 'package:freezed_annotation/freezed_annotation.dart';

part 'appointment_entity.freezed.dart';
part 'appointment_entity.g.dart';

enum AppointmentStatus { pending, confirmed, completed, cancelled }

enum AppointmentType { consultation, vaccine, exam, surgery }

@freezed
class AppointmentEntity with _$AppointmentEntity {
  const factory AppointmentEntity({
    required String id,
    required String ownerId,
    required String vetId,
    String? petId,
    required String petName,
    required DateTime dateTime,
    required AppointmentStatus status,
    required AppointmentType type,
    String? notes,
    required double price,
    String? vetName,
    String? ownerName,
    String? petPhotoUrl,
    String? petSpecies,
    String? petBreed,
  }) = _AppointmentEntity;

  factory AppointmentEntity.fromJson(Map<String, dynamic> json) => _$AppointmentEntityFromJson(json);
}

