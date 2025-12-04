import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/gamification_entities.dart';
import '../../domain/repositories/gamification_repository.dart';
import '../datasources/gamification_local_datasource.dart';
import '../datasources/gamification_remote_datasource.dart';

class GamificationRepositoryImpl implements GamificationRepository {
  final GamificationRemoteDataSource remoteDataSource;
  final GamificationLocalDataSource localDataSource;

  GamificationRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, GamificationProfile>> getProfile(String userId) async {
    try {
      final profile = await remoteDataSource.getProfile(userId);
      await localDataSource.cacheProfile(profile);
      return Right(profile);
    } catch (e) {
      try {
        final cachedProfile = await localDataSource.getCachedProfile();
        if (cachedProfile != null) {
          return Right(cachedProfile);
        }
      } catch (_) {}
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PointTransaction>>> getTransactionHistory(
    String userId,
  ) async {
    try {
      final transactions = await remoteDataSource.getTransactionHistory(userId);
      return Right(transactions);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<LeaderboardEntry>>> getLeaderboard({
    int limit = 10,
  }) async {
    try {
      final leaderboard = await remoteDataSource.getLeaderboard(limit: limit);
      return Right(leaderboard);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> getUserRanking(String userId) async {
    try {
      final ranking = await remoteDataSource.getUserRanking(userId);
      return Right(ranking);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addPoints({
    required String userId,
    required int amount,
    required PointActionType actionType,
    String? description,
  }) async {
    try {
      await remoteDataSource.addPoints(
        userId: userId,
        amount: amount,
        actionType: actionType,
        description: description,
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> hasClaimedDailyLoginToday(String userId) async {
    try {
      final hasClaimed =
          await remoteDataSource.hasClaimedDailyLoginToday(userId);
      return Right(hasClaimed);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

