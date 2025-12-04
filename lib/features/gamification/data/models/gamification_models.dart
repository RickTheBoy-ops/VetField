import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/gamification_entities.dart';

part 'gamification_models.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GamificationProfileModel extends GamificationProfile {
  const GamificationProfileModel({
    required super.userId,
    required super.currentPoints,
    required super.lifetimePoints,
    required super.level,
    required super.createdAt,
    required super.updatedAt,
  });

  factory GamificationProfileModel.fromJson(Map<String, dynamic> json) {
    return GamificationProfileModel(
      userId: json['user_id'] as String,
      currentPoints: json['current_points'] as int,
      lifetimePoints: json['lifetime_points'] as int,
      level: json['level'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'current_points': currentPoints,
        'lifetime_points': lifetimePoints,
        'level': level,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
      };
}

@JsonSerializable(fieldRename: FieldRename.snake)
class PointTransactionModel extends PointTransaction {
  const PointTransactionModel({
    required super.id,
    required super.userId,
    required super.amount,
    required super.actionType,
    super.description,
    required super.createdAt,
  });

  factory PointTransactionModel.fromJson(Map<String, dynamic> json) {
    return PointTransactionModel(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      amount: json['amount'] as int,
      actionType: _parseActionType(json['action_type'] as String),
      description: json['description'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'amount': amount,
        'action_type': _actionTypeToString(actionType),
        'description': description,
        'created_at': createdAt.toIso8601String(),
      };

  static PointActionType _parseActionType(String value) {
    switch (value) {
      case 'daily_login':
        return PointActionType.dailyLogin;
      case 'vaccine_registered':
        return PointActionType.vaccineRegistered;
      case 'appointment_completed':
        return PointActionType.appointmentCompleted;
      case 'referral':
        return PointActionType.referral;
      case 'profile_completed':
        return PointActionType.profileCompleted;
      case 'first_pet_registered':
        return PointActionType.firstPetRegistered;
      case 'health_record_updated':
        return PointActionType.healthRecordUpdated;
      case 'review_submitted':
        return PointActionType.reviewSubmitted;
      default:
        return PointActionType.dailyLogin;
    }
  }

  static String _actionTypeToString(PointActionType type) {
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

@JsonSerializable(fieldRename: FieldRename.snake)
class LeaderboardEntryModel extends LeaderboardEntry {
  const LeaderboardEntryModel({
    required super.userId,
    required super.name,
    super.avatarUrl,
    required super.level,
    required super.lifetimePoints,
    required super.rank,
  });

  factory LeaderboardEntryModel.fromJson(Map<String, dynamic> json) {
    return LeaderboardEntryModel(
      userId: json['user_id'] as String,
      name: json['name'] as String,
      avatarUrl: json['avatar_url'] as String?,
      level: json['level'] as int,
      lifetimePoints: json['lifetime_points'] as int,
      rank: json['rank'] as int,
    );
  }

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'name': name,
        'avatar_url': avatarUrl,
        'level': level,
        'lifetime_points': lifetimePoints,
        'rank': rank,
      };
}
