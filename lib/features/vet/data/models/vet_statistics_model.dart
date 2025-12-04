import '../../../appointment/domain/entities/appointment_entity.dart';
import '../../domain/entities/vet_statistics.dart';

/// Model for VetStatistics with JSON serialization
class VetStatisticsModel extends VetStatistics {
  const VetStatisticsModel({
    required super.todayAppointments,
    required super.weeklyRevenue,
    required super.revenueByType,
    required super.dailyRevenue,
    required super.monthlyRevenue,
  });

  /// Compute statistics from appointments list
  factory VetStatisticsModel.fromAppointments(
    List<AppointmentEntity> appointments,
  ) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    // Today's appointments count
    final todayCount = appointments
        .where((a) =>
            a.status != AppointmentStatus.cancelled &&
            DateTime(a.dateTime.year, a.dateTime.month, a.dateTime.day)
                .isAtSameMomentAs(today))
        .length;

    // Weekly revenue
    final weekStart = today.subtract(const Duration(days: 7));
    final weeklyRev = appointments
        .where((a) =>
            a.status != AppointmentStatus.cancelled &&
            a.dateTime.isAfter(weekStart))
        .fold<double>(0, (sum, a) => sum + a.price);

    // Revenue by type
    final revenueByType = <AppointmentType, double>{
      AppointmentType.consultation: 0,
      AppointmentType.vaccine: 0,
      AppointmentType.exam: 0,
      AppointmentType.surgery: 0,
    };
    for (final a in appointments) {
      if (a.status == AppointmentStatus.cancelled) continue;
      revenueByType[a.type] = (revenueByType[a.type] ?? 0) + a.price;
    }

    // Daily revenue (last 7 days)
    final dailyRev = _computeDailyRevenue(appointments, days: 7);

    // Monthly revenue (last 6 months)
    final monthlyRev = _computeMonthlyRevenue(appointments, months: 6);

    return VetStatisticsModel(
      todayAppointments: todayCount,
      weeklyRevenue: weeklyRev,
      revenueByType: revenueByType,
      dailyRevenue: dailyRev,
      monthlyRevenue: monthlyRev,
    );
  }

  static List<double> _computeDailyRevenue(
    List<AppointmentEntity> appointments, {
    int days = 7,
  }) {
    final now = DateTime.now();
    final start = DateTime(now.year, now.month, now.day)
        .subtract(Duration(days: days - 1));
    final buckets = List<double>.filled(days, 0);

    for (final a in appointments) {
      if (a.status == AppointmentStatus.cancelled) continue;
      final dayDate = DateTime(a.dateTime.year, a.dateTime.month, a.dateTime.day);
      if (dayDate.isBefore(start)) continue;
      final index = dayDate.difference(start).inDays;
      if (index >= 0 && index < days) {
        buckets[index] += a.price;
      }
    }
    return buckets;
  }

  static List<double> _computeMonthlyRevenue(
    List<AppointmentEntity> appointments, {
    int months = 6,
  }) {
    final now = DateTime.now();
    final buckets = List<double>.filled(months, 0);

    for (final a in appointments) {
      if (a.status == AppointmentStatus.cancelled) continue;
      final monthsDiff =
          (now.year - a.dateTime.year) * 12 + (now.month - a.dateTime.month);
      if (monthsDiff >= 0 && monthsDiff < months) {
        final index = months - 1 - monthsDiff;
        buckets[index] += a.price;
      }
    }
    return buckets;
  }
}
