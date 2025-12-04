import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/gamification_models.dart';
import '../../domain/entities/gamification_entities.dart';

abstract class GamificationRemoteDataSource {
  Future<GamificationProfileModel> getProfile(String userId);
  Future<List<PointTransactionModel>> getTransactionHistory(String userId);
  Future<List<LeaderboardEntryModel>> getLeaderboard({int limit = 10});
  Future<int> getUserRanking(String userId);
  Future<void> addPoints({
    required String userId,
    required int amount,
    required PointActionType actionType,
    String? description,
  });
  Future<bool> hasClaimedDailyLoginToday(String userId);
}

class GamificationRemoteDataSourceImpl implements GamificationRemoteDataSource {
  final SupabaseClient supabaseClient;

  GamificationRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<GamificationProfileModel> getProfile(String userId) async {
    final response = await supabaseClient
        .from('gamification_profiles')
        .select()
        .eq('user_id', userId)
        .single();

    return GamificationProfileModel.fromJson(response);
  }

  @override
  Future<List<PointTransactionModel>> getTransactionHistory(
    String userId,
  ) async {
    final response = await supabaseClient
        .from('point_transactions')
        .select()
        .eq('user_id', userId)
        .order('created_at', ascending: false)
        .limit(50);

    return (response as List)
        .map((json) => PointTransactionModel.fromJson(json))
        .toList();
  }

  @override
  Future<List<LeaderboardEntryModel>> getLeaderboard({int limit = 10}) async {
    final response = await supabaseClient.rpc(
      'get_leaderboard',
      params: {'limit_results': limit, 'offset_results': 0},
    );

    return (response as List)
        .map((json) => LeaderboardEntryModel.fromJson(json))
        .toList();
  }

  @override
  Future<int> getUserRanking(String userId) async {
    final response = await supabaseClient.rpc(
      'get_user_ranking',
      params: {'p_user_id': userId},
    );

    return response as int;
  }

  @override
  Future<void> addPoints({
    required String userId,
    required int amount,
    required PointActionType actionType,
    String? description,
  }) async {
    await supabaseClient.rpc(
      'add_points',
      params: {
        'p_user_id': userId,
        'p_amount': amount,
        'p_action_type': _actionTypeToString(actionType),
        'p_description': description,
      },
    );
  }

  @override
  Future<bool> hasClaimedDailyLoginToday(String userId) async {
    final response = await supabaseClient.rpc(
      'has_claimed_daily_login_today',
      params: {'p_user_id': userId},
    );

    return response as bool;
  }

  String _actionTypeToString(PointActionType type) {
    switch (type) {
      case PointActionType.dailyLogin:
        return 'daily_login';
      case PointActionType.vaccineRegistered:
        return 'vaccine_registered';
      case PointActionType.appointmentCompleted:
        return 'appointment_completed';
      case PointActionType.referral:
        return 'referral';
      case PointActionType.profileCompleted:
        return 'profile_completed';
      case PointActionType.firstPetRegistered:
        return 'first_pet_registered';
      case PointActionType.healthRecordUpdated:
        return 'health_record_updated';
      case PointActionType.reviewSubmitted:
        return 'review_submitted';
    }
  }
}
