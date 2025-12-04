import 'package:equatable/equatable.dart';

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

class GamificationProfile extends Equatable {
  final String userId;
  final int currentPoints;
  final int lifetimePoints;
  final int level;
  final DateTime createdAt;
  final DateTime updatedAt;

  const GamificationProfile({
    required this.userId,
    required this.currentPoints,
    required this.lifetimePoints,
    required this.level,
    required this.createdAt,
    required this.updatedAt,
  });

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

  @override
  List<Object?> get props => [
        userId,
        currentPoints,
        lifetimePoints,
        level,
        createdAt,
        updatedAt,
      ];
}

class PointTransaction extends Equatable {
  final String id;
  final String userId;
  final int amount;
  final PointActionType actionType;
  final String? description;
  final DateTime createdAt;

  const PointTransaction({
    required this.id,
    required this.userId,
    required this.amount,
    required this.actionType,
    this.description,
    required this.createdAt,
  });

  bool get isPositive => amount > 0;

  @override
  List<Object?> get props => [
        id,
        userId,
        amount,
        actionType,
        description,
        createdAt,
      ];
}

class LeaderboardEntry extends Equatable {
  final String userId;
  final String name;
  final String? avatarUrl;
  final int level;
  final int lifetimePoints;
  final int rank;

  const LeaderboardEntry({
    required this.userId,
    required this.name,
    this.avatarUrl,
    required this.level,
    required this.lifetimePoints,
    required this.rank,
  });

  @override
  List<Object?> get props => [
        userId,
        name,
        avatarUrl,
        level,
        lifetimePoints,
        rank,
      ];
}
