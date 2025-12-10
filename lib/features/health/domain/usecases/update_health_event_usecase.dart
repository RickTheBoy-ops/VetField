import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/health_event_entity.dart';
import '../repositories/health_repository.dart';

class UpdateHealthEventUseCase implements UseCase<HealthEventEntity, HealthEventEntity> {
  final HealthRepository repository;

  UpdateHealthEventUseCase(this.repository);

  @override
  Future<Either<Failure, HealthEventEntity>> call(HealthEventEntity event) async {
    return await repository.updateEvent(event);
  }
}
