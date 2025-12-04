import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../appointment/domain/entities/appointment_entity.dart';

part 'vet_statistics.freezed.dart';
part 'vet_statistics.g.dart';

@freezed
class VetStatistics with _$VetStatistics {
  const factory VetStatistics({
    required int todayAppointments,
    required double weeklyRevenue,
    required Map<AppointmentType, double> revenueByType,
    required List<double> dailyRevenue,
    required List<double> monthlyRevenue,
  }) = _VetStatistics;

  factory VetStatistics.fromJson(Map<String, dynamic> json) => _$VetStatisticsFromJson(json);
}

