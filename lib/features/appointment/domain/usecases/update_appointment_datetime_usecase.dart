import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/appointment_repository.dart';

class UpdateAppointmentDateTimeUseCase implements UseCase<void, UpdateAppointmentDateTimeParams> {
  final AppointmentRepository repository;

  UpdateAppointmentDateTimeUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(UpdateAppointmentDateTimeParams params) {
    return repository.updateAppointmentDateTime(
      appointmentId: params.appointmentId,
      newDateTime: params.newDateTime,
    );
  }
}

class UpdateAppointmentDateTimeParams {
  final String appointmentId;
  final DateTime newDateTime;

  const UpdateAppointmentDateTimeParams({
    required this.appointmentId,
    required this.newDateTime,
  });
}
