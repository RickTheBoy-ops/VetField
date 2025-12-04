import 'package:equatable/equatable.dart';

enum CampaignType { bannerHome, searchHighlight }
enum CampaignStatus { active, paused, finished }

class CampaignEntity extends Equatable {
  final String id;
  final String vetId;
  final CampaignType type;
  final CampaignStatus status;
  final DateTime startDate;
  final DateTime? endDate;
  final double budget;
  final double currentSpend;
  final int impressionsCount;
  final int clicksCount;
  final String? imageUrl;
  final DateTime createdAt;
  final DateTime updatedAt;

  const CampaignEntity({
    required this.id,
    required this.vetId,
    required this.type,
    required this.status,
    required this.startDate,
    this.endDate,
    required this.budget,
    required this.currentSpend,
    required this.impressionsCount,
    required this.clicksCount,
    this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  // Computed properties
  double get ctr => impressionsCount > 0 
      ? (clicksCount / impressionsCount) * 100 
      : 0;

  bool get isActive => status == CampaignStatus.active &&
      (endDate == null || endDate!.isAfter(DateTime.now()));

  double get budgetUsagePercentage => budget > 0 
      ? (currentSpend / budget) * 100 
      : 0;

  @override
  List<Object?> get props => [
    id, vetId, type, status, startDate, endDate, budget, currentSpend,
    impressionsCount, clicksCount, imageUrl, createdAt, updatedAt
  ];
}
