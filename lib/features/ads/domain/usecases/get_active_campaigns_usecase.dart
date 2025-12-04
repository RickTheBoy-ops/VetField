import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/campaign_entity.dart';
import '../repositories/ads_repository.dart';

class GetActiveCampaignsParams {
  final String? vetId;
  final int limit;

  GetActiveCampaignsParams({this.vetId, this.limit = 5});
}

class GetActiveCampaignsUseCase 
    implements UseCase<List<CampaignEntity>, GetActiveCampaignsParams> {
  final AdsRepository repository;

  GetActiveCampaignsUseCase(this.repository);

  @override
  Future<Either<Failure, List<CampaignEntity>>> call(
    GetActiveCampaignsParams params
  ) {
    if (params.vetId != null) {
      return repository.getVetCampaigns(params.vetId!);
    }
    return repository.getActiveBanners(limit: params.limit);
  }
}
