import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/health_event_entity.dart';

abstract class HealthRepository {
  Future<Either<Failure, List<HealthEventEntity>>> getEventsByOwner(String ownerId);
  Future<Either<Failure, HealthEventEntity>> addEvent({
    required HealthEventType type,
    required DateTime date,
    String? details,
    String? petId,
    String? attachmentUrl,
  });
}
