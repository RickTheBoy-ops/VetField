import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/ads_repository.dart';

class TrackClickUseCase implements UseCase<void, String> {
  final AdsRepository repository;

  TrackClickUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(String campaignId) {
    return repository.trackClick(campaignId);
  }
}
