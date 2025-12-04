// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gamification_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GamificationProfileModel _$GamificationProfileModelFromJson(
        Map<String, dynamic> json) =>
    GamificationProfileModel(
      userId: json['user_id'] as String,
      currentPoints: (json['current_points'] as num).toInt(),
      lifetimePoints: (json['lifetime_points'] as num).toInt(),
      level: (json['level'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$GamificationProfileModelToJson(
        GamificationProfileModel instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'current_points': instance.currentPoints,
      'lifetime_points': instance.lifetimePoints,
      'level': instance.level,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

PointTransactionModel _$PointTransactionModelFromJson(
        Map<String, dynamic> json) =>
    PointTransactionModel(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      amount: (json['amount'] as num).toInt(),
      actionType: $enumDecode(_$PointActionTypeEnumMap, json['action_type']),
      description: json['description'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$PointTransactionModelToJson(
        PointTransactionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'amount': instance.amount,
      'action_type': _$PointActionTypeEnumMap[instance.actionType]!,
      'description': instance.description,
      'created_at': instance.createdAt.toIso8601String(),
    };

const _$PointActionTypeEnumMap = {
  PointActionType.dailyLogin: 'dailyLogin',
  PointActionType.vaccineRegistered: 'vaccineRegistered',
  PointActionType.appointmentCompleted: 'appointmentCompleted',
  PointActionType.referral: 'referral',
  PointActionType.profileCompleted: 'profileCompleted',
  PointActionType.firstPetRegistered: 'firstPetRegistered',
  PointActionType.healthRecordUpdated: 'healthRecordUpdated',
  PointActionType.reviewSubmitted: 'reviewSubmitted',
};

LeaderboardEntryModel _$LeaderboardEntryModelFromJson(
        Map<String, dynamic> json) =>
    LeaderboardEntryModel(
      userId: json['user_id'] as String,
      name: json['name'] as String,
      avatarUrl: json['avatar_url'] as String?,
      level: (json['level'] as num).toInt(),
      lifetimePoints: (json['lifetime_points'] as num).toInt(),
      rank: (json['rank'] as num).toInt(),
    );

Map<String, dynamic> _$LeaderboardEntryModelToJson(
        LeaderboardEntryModel instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'name': instance.name,
      'avatar_url': instance.avatarUrl,
      'level': instance.level,
      'lifetime_points': instance.lifetimePoints,
      'rank': instance.rank,
    };
