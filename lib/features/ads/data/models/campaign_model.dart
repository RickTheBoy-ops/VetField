import '../../domain/entities/campaign_entity.dart';

class CampaignModel extends CampaignEntity {
  const CampaignModel({
    required super.id,
    required super.vetId,
    required super.type,
    required super.status,
    required super.startDate,
    super.endDate,
    required super.budget,
    required super.currentSpend,
    required super.impressionsCount,
    required super.clicksCount,
    super.imageUrl,
    required super.createdAt,
    required super.updatedAt,
  });

  factory CampaignModel.fromJson(Map<String, dynamic> json) {
    return CampaignModel(
      id: json['id'] as String,
      vetId: json['vet_id'] as String,
      type: _parseCampaignType(json['type'] as String),
      status: _parseCampaignStatus(json['status'] as String),
      startDate: DateTime.parse(json['start_date'] as String),
      endDate: json['end_date'] != null 
          ? DateTime.parse(json['end_date'] as String) 
          : null,
      budget: (json['budget'] as num).toDouble(),
      currentSpend: (json['current_spend'] as num).toDouble(),
      impressionsCount: json['impressions_count'] as int,
      clicksCount: json['clicks_count'] as int,
      imageUrl: json['image_url'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'vet_id': vetId,
    'type': _campaignTypeToString(type),
    'status': _campaignStatusToString(status),
    'start_date': startDate.toIso8601String(),
    'end_date': endDate?.toIso8601String(),
    'budget': budget,
    'current_spend': currentSpend,
    'impressions_count': impressionsCount,
    'clicks_count': clicksCount,
    'image_url': imageUrl,
    'created_at': createdAt.toIso8601String(),
    'updated_at': updatedAt.toIso8601String(),
  };

  static CampaignType _parseCampaignType(String value) {
    switch (value) {
      case 'banner_home':
        return CampaignType.bannerHome;
      case 'search_highlight':
        return CampaignType.searchHighlight;
      default:
        return CampaignType.bannerHome;
    }
  }

  static CampaignStatus _parseCampaignStatus(String value) {
    switch (value) {
      case 'active':
        return CampaignStatus.active;
      case 'paused':
        return CampaignStatus.paused;
      case 'finished':
        return CampaignStatus.finished;
      default:
        return CampaignStatus.active;
    }
  }

  static String _campaignTypeToString(CampaignType type) {
    switch (type) {
      case CampaignType.bannerHome:
        return 'banner_home';
      case CampaignType.searchHighlight:
        return 'search_highlight';
    }
  }

  static String _campaignStatusToString(CampaignStatus status) {
    switch (status) {
      case CampaignStatus.active:
        return 'active';
      case CampaignStatus.paused:
        return 'paused';
      case CampaignStatus.finished:
        return 'finished';
    }
  }
}
