import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/ads_repository.dart';

class TrackImpressionUseCase implements UseCase<void, String> {
  final AdsRepository repository;

  TrackImpressionUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(String campaignId) {
    return repository.trackImpression(campaignId);
  }
}
