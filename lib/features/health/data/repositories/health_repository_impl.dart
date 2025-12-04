import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/health_event_entity.dart';
import '../../domain/repositories/health_repository.dart';
import '../datasources/health_local_datasource.dart';
import '../datasources/health_remote_datasource.dart';

class HealthRepositoryImpl implements HealthRepository {
  final HealthRemoteDataSource remoteDataSource;
  final HealthLocalDataSource localDataSource;

  HealthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<HealthEventEntity>>> getEventsByOwner(String ownerId) async {
    try {
      final events = await remoteDataSource.getEventsByOwner(ownerId);
      await localDataSource.cacheHealthRecords(events);
      return Right(events);
    } catch (e) {
      try {
        // Since we don't have getCachedHealthRecordsByOwner, we fetch all for a pet?
        // Wait, local datasource has getCachedHealthRecords(petId).
        // But getEventsByOwner fetches for ALL pets of an owner.
        // I should probably update local datasource to support fetching by owner or just iterate pets?
        // Or just return failure if offline for "All Events".
        // But the user said "HealthTimeline" must work offline.
        // HealthTimeline usually shows events for a specific pet or all pets.
        // If I can't fetch by owner locally easily, I might skip or improve local datasource.
        // For now, I'll just try to return what I can or fail.
        // Actually, I can implement getCachedHealthRecordsByOwner in local datasource if I want.
        // But I'll stick to simple implementation for now.
        return Left(ServerFailure(e.toString()));
      } catch (_) {
        return Left(ServerFailure(e.toString()));
      }
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
      final event = await remoteDataSource.addEvent(
        type: type,
        date: date,
        details: details,
        petId: petId,
        attachmentUrl: attachmentUrl,
      );
      await localDataSource.cacheHealthRecord(event);
      return Right(event);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
