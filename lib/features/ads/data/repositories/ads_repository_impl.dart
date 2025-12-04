import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/campaign_entity.dart';
import '../../domain/repositories/ads_repository.dart';
import '../datasources/ads_remote_datasource.dart';

class AdsRepositoryImpl implements AdsRepository {
  final AdsRemoteDataSource remoteDataSource;

  AdsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<CampaignEntity>>> getVetCampaigns(
    String vetId
  ) async {
    try {
      final campaigns = await remoteDataSource.getVetCampaigns(vetId);
      return Right(campaigns);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CampaignEntity>>> getActiveBanners({
    int limit = 5
  }) async {
    try {
      final banners = await remoteDataSource.getActiveBanners(limit: limit);
      return Right(banners);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> trackImpression(String campaignId) async {
    try {
      await remoteDataSource.trackImpression(campaignId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> trackClick(String campaignId) async {
    try {
      await remoteDataSource.trackClick(campaignId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
