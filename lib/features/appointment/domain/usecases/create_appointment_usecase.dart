import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/appointment_entity.dart';
import '../repositories/appointment_repository.dart';

class CreateAppointmentUseCase implements UseCase<AppointmentEntity, CreateAppointmentParams> {
  final AppointmentRepository repository;

  CreateAppointmentUseCase(this.repository);

  @override
  Future<Either<Failure, AppointmentEntity>> call(CreateAppointmentParams params) {
    return repository.createAppointment(
      vetId: params.vetId,
      petName: params.petName,
      dateTime: params.dateTime,
      type: params.type,
      notes: params.notes,
    );
  }
}

class CreateAppointmentParams extends Equatable {
  final String vetId;
  final String petName;
  final DateTime dateTime;
  final AppointmentType type;
  final String? notes;

  const CreateAppointmentParams({
    required this.vetId,
    required this.petName,
    required this.dateTime,
    required this.type,
    this.notes,
  });

  @override
  List<Object?> get props => [vetId, petName, dateTime, type, notes];
}
