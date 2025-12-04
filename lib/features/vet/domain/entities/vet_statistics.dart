import 'package:equatable/equatable.dart';
import '../../../appointment/domain/entities/appointment_entity.dart';

/// Entity representing veterinarian dashboard statistics
class VetStatistics extends Equatable {
  final int todayAppointments;
  final double weeklyRevenue;
  final Map<AppointmentType, double> revenueByType;
  final List<double> dailyRevenue; // Last 7 days
  final List<double> monthlyRevenue; // Last 6 months

  const VetStatistics({
    required this.todayAppointments,
    required this.weeklyRevenue,
    required this.revenueByType,
    required this.dailyRevenue,
    required this.monthlyRevenue,
  });

  @override
  List<Object?> get props => [
        todayAppointments,
        weeklyRevenue,
        revenueByType,
        dailyRevenue,
        monthlyRevenue,
      ];
}
