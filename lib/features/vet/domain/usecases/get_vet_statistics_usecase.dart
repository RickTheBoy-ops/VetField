import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/vet_statistics.dart';
import '../repositories/vet_repository.dart';

class GetVetStatisticsParams {
  final String vetId;

  const GetVetStatisticsParams({required this.vetId});
}

/// UseCase for getting vet dashboard statistics
class GetVetStatisticsUseCase {
  final VetRepository repository;

  GetVetStatisticsUseCase(this.repository);

  Future<Either<Failure, VetStatistics>> call(
    GetVetStatisticsParams params,
  ) async {
    return await repository.getStatistics(params.vetId);
  }
}
