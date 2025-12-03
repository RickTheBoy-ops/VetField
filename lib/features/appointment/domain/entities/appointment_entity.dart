import 'package:equatable/equatable.dart';

enum AppointmentStatus { pending, confirmed, completed, cancelled }
enum AppointmentType { consultation, vaccine, exam, surgery }

class AppointmentEntity extends Equatable {
  final String id;
  final String ownerId;
  final String vetId;
  final String petName;
  final DateTime dateTime;
  final AppointmentStatus status;
  final AppointmentType type;
  final String? notes;
  final double price;
  
  // Campos de display (opcionais, preenchidos via join)
  final String? vetName;
  final String? ownerName;

  const AppointmentEntity({
    required this.id,
    required this.ownerId,
    required this.vetId,
    required this.petName,
    required this.dateTime,
    required this.status,
    required this.type,
    this.notes,
    required this.price,
    this.vetName,
    this.ownerName,
  });

  @override
  List<Object?> get props => [
    id, ownerId, vetId, petName, dateTime, status, type, notes, price, vetName, ownerName
  ];
}
