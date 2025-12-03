import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/appointment_entity.dart';

abstract class AppointmentRepository {
  Future<Either<Failure, AppointmentEntity>> createAppointment({
    required String vetId,
    required String petName,
    required DateTime dateTime,
    required AppointmentType type,
    String? notes,
  });

  Future<Either<Failure, List<AppointmentEntity>>> getVetAppointments(String vetId);
  Future<Either<Failure, List<AppointmentEntity>>> getOwnerAppointments(String ownerId);
  
  Future<Either<Failure, void>> updateAppointmentStatus({
    required String appointmentId,
    required AppointmentStatus status,
  });
}
