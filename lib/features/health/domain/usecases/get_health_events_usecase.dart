import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/health_event_entity.dart';
import '../repositories/health_repository.dart';

class GetHealthEventsUseCase implements UseCase<List<HealthEventEntity>, String> {
  final HealthRepository repository;

  GetHealthEventsUseCase(this.repository);

  @override
  Future<Either<Failure, List<HealthEventEntity>>> call(String ownerId) {
    return repository.getEventsByOwner(ownerId);
  }
}
