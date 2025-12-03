import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../datasources/health_remote_datasource.dart';
import '../../domain/entities/health_event_entity.dart';
import '../../domain/repositories/health_repository.dart';

class HealthRepositoryImpl implements HealthRepository {
  final HealthRemoteDataSource remote;

  HealthRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, List<HealthEventEntity>>> getEventsByOwner(String ownerId) async {
    try {
      final events = await remote.getEventsByOwner(ownerId);
      return Right(events);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, HealthEventEntity>> addEvent({
    required HealthEventType type,
    required DateTime date,
    String? details,
    String? petId,
    String? attachmentUrl,
  }) async {
    try {
      final event = await remote.addEvent(
        type: type,
        date: date,
        details: details,
        petId: petId,
        attachmentUrl: attachmentUrl,
      );
      return Right(event);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
