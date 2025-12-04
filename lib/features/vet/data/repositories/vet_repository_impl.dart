import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../appointment/domain/repositories/appointment_repository.dart';
import '../../domain/entities/vet_statistics.dart';
import '../../domain/repositories/vet_repository.dart';
import '../models/vet_statistics_model.dart';

/// Implementation of VetRepository
class VetRepositoryImpl implements VetRepository {
  final AppointmentRepository appointmentRepository;

  VetRepositoryImpl({required this.appointmentRepository});

  @override
  Future<Either<Failure, VetStatistics>> getStatistics(String vetId) async {
    try {
      // Get appointments for vet
      final result = await appointmentRepository.getVetAppointments(vetId);

      return result.fold(
        (failure) => Left(failure),
        (appointments) {
          // Compute statistics from appointments
          final stats = VetStatisticsModel.fromAppointments(appointments);
          return Right(stats);
        },
      );
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> getUpcomingAppointmentsCount(
    String vetId,
  ) async {
    try {
      final result = await appointmentRepository.getVetAppointments(vetId);

      return result.fold(
        (failure) => Left(failure),
        (appointments) {
          final upcoming = appointments.where((a) => a.dateTime.isAfter(DateTime.now())).length;
          return Right(upcoming);
        },
      );
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
