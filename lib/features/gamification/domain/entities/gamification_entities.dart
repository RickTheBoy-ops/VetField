import 'package:freezed_annotation/freezed_annotation.dart';

part 'gamification_entities.freezed.dart';
part 'gamification_entities.g.dart';

enum PointActionType {
  dailyLogin,
  vaccineRegistered,
  appointmentCompleted,
  referral,
  profileCompleted,
  firstPetRegistered,
  healthRecordUpdated,
  reviewSubmitted,
}

@freezed
class GamificationProfile with _$GamificationProfile {
  const GamificationProfile._();

  const factory GamificationProfile({
    required String userId,
    required int currentPoints,
    required int lifetimePoints,
    required int level,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _GamificationProfile;

  factory GamificationProfile.fromJson(Map<String, dynamic> json) => _$GamificationProfileFromJson(json);

  // Computed properties
  String get levelTitle {
    switch (level) {
      case 1:
        return 'Tutor Bronze';
      case 2:
        return 'Tutor Prata';
      case 3:
        return 'Tutor Ouro';
      case 4:
        return 'Tutor Platinum';
      case 5:
        return 'Tutor Diamante';
      default:
        return 'Tutor Lendário';
    }
  }

  int get pointsToNextLevel {
    final nextLevelThreshold = (level * 100) * (level * 100);
    return nextLevelThreshold - currentPoints;
  }

  double get progressToNextLevel {
    final currentLevelThreshold = ((level - 1) * 100) * ((level - 1) * 100);
    final nextLevelThreshold = (level * 100) * (level * 100);
    final levelRange = nextLevelThreshold - currentLevelThreshold;
    final progressSinceLevelStart = currentPoints - currentLevelThreshold;
    return progressSinceLevelStart / levelRange;
  }
}

@freezed
class PointTransaction with _$PointTransaction {
  const PointTransaction._();

  const factory PointTransaction({
    required String id,
    required String userId,
    required int amount,
    required PointActionType actionType,
    String? description,
    required DateTime createdAt,
  }) = _PointTransaction;

  factory PointTransaction.fromJson(Map<String, dynamic> json) => _$PointTransactionFromJson(json);

  bool get isPositive => amount > 0;
}

@freezed
class LeaderboardEntry with _$LeaderboardEntry {
  const factory LeaderboardEntry({
    required String userId,
    required String name,
    String? avatarUrl,
    required int level,
    required int lifetimePoints,
    required int rank,
  }) = _LeaderboardEntry;

  factory LeaderboardEntry.fromJson(Map<String, dynamic> json) => _$LeaderboardEntryFromJson(json);
}

