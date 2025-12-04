import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/supabase_provider.dart';
import '../../data/datasources/gamification_remote_datasource.dart';
import '../../data/repositories/gamification_repository_impl.dart';
import '../../domain/repositories/gamification_repository.dart';
import '../../domain/entities/gamification_entities.dart';
import '../../../auth/presentation/providers/auth_provider.dart';

part 'gamification_provider.g.dart';

// Data Sources
@riverpod
GamificationRemoteDataSource gamificationRemoteDataSource(Ref ref) {
  final supabaseClient = ref.watch(supabaseClientProvider);
  return GamificationRemoteDataSourceImpl(supabaseClient);
}

// Repositories
@riverpod
GamificationRepository gamificationRepository(Ref ref) {
  final remoteDataSource = ref.watch(gamificationRemoteDataSourceProvider);
  return GamificationRepositoryImpl(remoteDataSource: remoteDataSource);
}

// Current User Profile Provider
@riverpod
Future<GamificationProfile> userGamificationProfile(Ref ref) async {
  final user = ref.watch(currentUserProvider);
  if (user == null) {
    throw Exception('User not authenticated');
  }

  final repository = ref.watch(gamificationRepositoryProvider);
  final result = await repository.getProfile(user.id);

  return result.fold(
    (failure) => throw Exception(failure.message),
    (profile) => profile,
  );
}

// Transaction History Provider
@riverpod
Future<List<PointTransaction>> userTransactionHistory(Ref ref) async {
  final user = ref.watch(currentUserProvider);
  if (user == null) {
    throw Exception('User not authenticated');
  }

  final repository = ref.watch(gamificationRepositoryProvider);
  final result = await repository.getTransactionHistory(user.id);

  return result.fold(
    (failure) => throw Exception(failure.message),
    (transactions) => transactions,
  );
}

// Leaderboard Provider
@riverpod
Future<List<LeaderboardEntry>> leaderboardProvider(Ref ref, {int limit = 10}) async {
  final repository = ref.watch(gamificationRepositoryProvider);
  final result = await repository.getLeaderboard(limit: limit);

  return result.fold(
    (failure) => throw Exception(failure.message),
    (leaderboard) => leaderboard,
  );
}

// Gamification Service Controller
@riverpod
class GamificationController extends _$GamificationController {
  @override
  FutureOr<void> build() => null;

  // Award daily login points
  Future<void> checkAndAwardDailyLogin() async {
    final user = ref.read(currentUserProvider);
    if (user == null) return;

    final repository = ref.read(gamificationRepositoryProvider);
    
    // Check if already claimed today
    final hasClaimedResult =
        await repository.hasClaimedDailyLoginToday(user.id);
    
    final hasClaimed = hasClaimedResult.fold(
      (failure) => true, // Assume claimed on error
      (claimed) => claimed,
    );

    if (!hasClaimed) {
      // Award 10 points for daily login
      await repository.addPoints(
        userId: user.id,
        amount: 10,
        actionType: PointActionType.dailyLogin,
        description: 'Login diário',
      );

      // Refresh profile
      ref.invalidate(userGamificationProfileProvider);
    }
  }

  // Award points for completing appointment
  Future<void> awardAppointmentCompleted() async {
    final user = ref.read(currentUserProvider);
    if (user == null) return;

    final repository = ref.read(gamificationRepositoryProvider);
    await repository.addPoints(
      userId: user.id,
      amount: 30,
      actionType: PointActionType.appointmentCompleted,
      description: 'Consulta concluída',
    );

    ref.invalidate(userGamificationProfileProvider);
  }

  // Award points for registering vaccine
  Future<void> awardVaccineRegistered() async {
    final user = ref.read(currentUserProvider);
    if (user == null) return;

    final repository = ref.read(gamificationRepositoryProvider);
    await repository.addPoints(
      userId: user.id,
      amount: 50,
      actionType: PointActionType.vaccineRegistered,
      description: 'Vacina registrada',
    );

    ref.invalidate(userGamificationProfileProvider);
  }

  // Award points for referral
  Future<void> awardReferral() async {
    final user = ref.read(currentUserProvider);
    if (user == null) return;

    final repository = ref.read(gamificationRepositoryProvider);
    await repository.addPoints(
      userId: user.id,
      amount: 100,
      actionType: PointActionType.referral,
      description: 'Indicação de amigo',
    );

    ref.invalidate(userGamificationProfileProvider);
  }
}
