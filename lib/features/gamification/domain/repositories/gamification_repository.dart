import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/gamification_entities.dart';

abstract class GamificationRepository {
  Future<Either<Failure, GamificationProfile>> getProfile(String userId);
  Future<Either<Failure, List<PointTransaction>>> getTransactionHistory(String userId);
  Future<Either<Failure, List<LeaderboardEntry>>> getLeaderboard({int limit = 10});
  Future<Either<Failure, int>> getUserRanking(String userId);
  Future<Either<Failure, void>> addPoints({
    required String userId,
    required int amount,
    required PointActionType actionType,
    String? description,
  });
  Future<Either<Failure, bool>> hasClaimedDailyLoginToday(String userId);
}
