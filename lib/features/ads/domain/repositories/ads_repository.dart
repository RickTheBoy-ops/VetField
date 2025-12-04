import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/campaign_entity.dart';

abstract class AdsRepository {
  Future<Either<Failure, List<CampaignEntity>>> getVetCampaigns(String vetId);
  Future<Either<Failure, List<CampaignEntity>>> getActiveBanners({int limit = 5});
  Future<Either<Failure, void>> trackImpression(String campaignId);
  Future<Either<Failure, void>> trackClick(String campaignId);
}
