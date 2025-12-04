import 'package:equatable/equatable.dart';

class AdMetrics extends Equatable {
  final int impressions;
  final int clicks;
  final double ctr;
  final double spend;
  final double budget;

  const AdMetrics({
    required this.impressions,
    required this.clicks,
    required this.ctr,
    required this.spend,
    required this.budget,
  });

  AdMetrics copyWith({
    int? impressions,
    int? clicks,
    double? ctr,
    double? spend,
    double? budget,
  }) {
    return AdMetrics(
      impressions: impressions ?? this.impressions,
      clicks: clicks ?? this.clicks,
      ctr: ctr ?? this.ctr,
      spend: spend ?? this.spend,
      budget: budget ?? this.budget,
    );
  }

  @override
  List<Object?> get props => [impressions, clicks, ctr, spend, budget];
}
