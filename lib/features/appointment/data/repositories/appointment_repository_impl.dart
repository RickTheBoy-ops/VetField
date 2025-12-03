import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/appointment_entity.dart';
import '../../domain/repositories/appointment_repository.dart';
import '../datasources/appointment_remote_datasource.dart';
import '../datasources/appointment_local_datasource.dart';

class AppointmentRepositoryImpl implements AppointmentRepository {
  final AppointmentRemoteDataSource remoteDataSource;
  final AppointmentLocalDataSource localDataSource;

  AppointmentRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, AppointmentEntity>> createAppointment({
    required String vetId,
    String? petId,
    required String petName,
    required DateTime dateTime,
    required AppointmentType type,
    String? notes,
  }) async {
    try {
      final appointment = await remoteDataSource.createAppointment(
        vetId: vetId,
        petId: petId,
        petName: petName,
        dateTime: dateTime,
        type: type,
        notes: notes,
      );
      return Right(appointment);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<AppointmentEntity>>> getVetAppointments(String vetId) async {
    try {
      final appointments = await remoteDataSource.getVetAppointments(vetId);
      // Atualizar cache
      await localDataSource.cacheAppointments(vetId, appointments);
      return Right(appointments);
    } catch (e) {
      // Se falhar, tentar buscar do cache
      try {
        final cachedAppointments = await localDataSource.getCachedAppointments(vetId);
        if (cachedAppointments.isNotEmpty) {
          return Right(cachedAppointments);
        }
      } catch (_) {}
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<AppointmentEntity>>> getOwnerAppointments(String ownerId) async {
    try {
      final appointments = await remoteDataSource.getOwnerAppointments(ownerId);
      // Atualizar cache
      await localDataSource.cacheAppointments(ownerId, appointments);
      return Right(appointments);
    } catch (e) {
      // Se falhar, tentar buscar do cache
      try {
        final cachedAppointments = await localDataSource.getCachedAppointments(ownerId);
        if (cachedAppointments.isNotEmpty) {
          return Right(cachedAppointments);
        }
      } catch (_) {}
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateAppointmentStatus({
    required String appointmentId,
    required AppointmentStatus status,
  }) async {
    try {
      await remoteDataSource.updateAppointmentStatus(appointmentId, status);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateAppointmentDateTime({
    required String appointmentId,
    required DateTime newDateTime,
  }) async {
    try {
      await remoteDataSource.updateAppointmentDateTime(appointmentId, newDateTime);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
