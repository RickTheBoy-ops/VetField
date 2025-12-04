// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CampaignModel _$CampaignModelFromJson(Map<String, dynamic> json) =>
    CampaignModel(
      id: json['id'] as String,
      vetId: json['vet_id'] as String,
      type: $enumDecode(_$CampaignTypeEnumMap, json['type']),
      status: $enumDecode(_$CampaignStatusEnumMap, json['status']),
      startDate: DateTime.parse(json['start_date'] as String),
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      budget: (json['budget'] as num).toDouble(),
      currentSpend: (json['current_spend'] as num).toDouble(),
      impressionsCount: (json['impressions_count'] as num).toInt(),
      clicksCount: (json['clicks_count'] as num).toInt(),
      imageUrl: json['image_url'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$CampaignModelToJson(CampaignModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vet_id': instance.vetId,
      'type': _$CampaignTypeEnumMap[instance.type]!,
      'status': _$CampaignStatusEnumMap[instance.status]!,
      'start_date': instance.startDate.toIso8601String(),
      'end_date': instance.endDate?.toIso8601String(),
      'budget': instance.budget,
      'current_spend': instance.currentSpend,
      'impressions_count': instance.impressionsCount,
      'clicks_count': instance.clicksCount,
      'image_url': instance.imageUrl,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

const _$CampaignTypeEnumMap = {
  CampaignType.bannerHome: 'bannerHome',
  CampaignType.searchHighlight: 'searchHighlight',
};

const _$CampaignStatusEnumMap = {
  CampaignStatus.active: 'active',
  CampaignStatus.paused: 'paused',
  CampaignStatus.finished: 'finished',
};
