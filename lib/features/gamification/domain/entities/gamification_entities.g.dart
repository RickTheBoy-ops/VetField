// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gamification_entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GamificationProfileImpl _$$GamificationProfileImplFromJson(
        Map<String, dynamic> json) =>
    _$GamificationProfileImpl(
      userId: json['userId'] as String,
      currentPoints: (json['currentPoints'] as num).toInt(),
      lifetimePoints: (json['lifetimePoints'] as num).toInt(),
      level: (json['level'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$GamificationProfileImplToJson(
        _$GamificationProfileImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'currentPoints': instance.currentPoints,
      'lifetimePoints': instance.lifetimePoints,
      'level': instance.level,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$PointTransactionImpl _$$PointTransactionImplFromJson(
        Map<String, dynamic> json) =>
    _$PointTransactionImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      amount: (json['amount'] as num).toInt(),
      actionType: $enumDecode(_$PointActionTypeEnumMap, json['actionType']),
      description: json['description'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$PointTransactionImplToJson(
        _$PointTransactionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'amount': instance.amount,
      'actionType': _$PointActionTypeEnumMap[instance.actionType]!,
      'description': instance.description,
      'createdAt': instance.createdAt.toIso8601String(),
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

_$LeaderboardEntryImpl _$$LeaderboardEntryImplFromJson(
        Map<String, dynamic> json) =>
    _$LeaderboardEntryImpl(
      userId: json['userId'] as String,
      name: json['name'] as String,
      avatarUrl: json['avatarUrl'] as String?,
      level: (json['level'] as num).toInt(),
      lifetimePoints: (json['lifetimePoints'] as num).toInt(),
      rank: (json['rank'] as num).toInt(),
    );

Map<String, dynamic> _$$LeaderboardEntryImplToJson(
        _$LeaderboardEntryImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'avatarUrl': instance.avatarUrl,
      'level': instance.level,
      'lifetimePoints': instance.lifetimePoints,
      'rank': instance.rank,
    };
