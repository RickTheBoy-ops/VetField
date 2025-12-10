import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/health_repository.dart';

class DeleteHealthEventUseCase implements UseCase<void, String> {
  final HealthRepository repository;

  DeleteHealthEventUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(String id) async {
    return await repository.deleteEvent(id);
  }
}
