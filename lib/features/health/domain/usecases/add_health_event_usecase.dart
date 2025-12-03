import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/health_event_entity.dart';
import '../repositories/health_repository.dart';

class AddHealthEventUseCase implements UseCase<HealthEventEntity, AddHealthEventParams> {
  final HealthRepository repository;

  AddHealthEventUseCase(this.repository);

  @override
  Future<Either<Failure, HealthEventEntity>> call(AddHealthEventParams params) {
    return repository.addEvent(
      type: params.type,
      date: params.date,
      details: params.details,
      petId: params.petId,
      attachmentUrl: params.attachmentUrl,
    );
  }
}

class AddHealthEventParams {
  final HealthEventType type;
  final DateTime date;
  final String? details;
  final String? petId;
  final String? attachmentUrl;

  const AddHealthEventParams({
    required this.type,
    required this.date,
    this.details,
    this.petId,
    this.attachmentUrl,
  });
}
