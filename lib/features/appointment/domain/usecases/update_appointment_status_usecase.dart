import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/appointment_entity.dart';
import '../repositories/appointment_repository.dart';

class UpdateAppointmentStatusUseCase implements UseCase<void, UpdateAppointmentStatusParams> {
  final AppointmentRepository repository;

  UpdateAppointmentStatusUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(UpdateAppointmentStatusParams params) {
    return repository.updateAppointmentStatus(
      appointmentId: params.appointmentId,
      status: params.status,
    );
  }
}

class UpdateAppointmentStatusParams {
  final String appointmentId;
  final AppointmentStatus status;

  const UpdateAppointmentStatusParams({
    required this.appointmentId,
    required this.status,
  });
}
