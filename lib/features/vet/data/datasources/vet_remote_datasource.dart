import 'package:supabase_flutter/supabase_flutter.dart';
import '../../domain/entities/vet_statistics.dart';
import '../../../appointment/domain/entities/appointment_entity.dart';

abstract class VetRemoteDataSource {
  Future<VetStatistics> getStatistics(String vetId);
}

class VetRemoteDataSourceImpl implements VetRemoteDataSource {
  final SupabaseClient supabaseClient;

  VetRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<VetStatistics> getStatistics(String vetId) async {
    // Fetch appointments for the vet
    final response = await supabaseClient
        .from('appointments')
        .select()
        .eq('vet_id', vetId);

    final appointments = (response as List).map((json) => AppointmentEntity.fromJson(json)).toList();

    // Calculate statistics
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final weekStart = now.subtract(const Duration(days: 7));
    
    int todayAppointments = 0;
    double weeklyRevenue = 0;
    Map<AppointmentType, double> revenueByType = {};
    List<double> dailyRevenue = List.filled(7, 0.0);
    List<double> monthlyRevenue = List.filled(6, 0.0);

    for (var appt in appointments) {
      if (appt.dateTime.isAfter(today)) {
        todayAppointments++;
      }
      if (appt.dateTime.isAfter(weekStart)) {
        weeklyRevenue += appt.price;
        
        final dayIndex = 6 - now.difference(appt.dateTime).inDays;
        if (dayIndex >= 0 && dayIndex < 7) {
          dailyRevenue[dayIndex] += appt.price;
        }
      }
      
      revenueByType[appt.type] = (revenueByType[appt.type] ?? 0) + appt.price;
    }

    return VetStatistics(
      todayAppointments: todayAppointments,
      weeklyRevenue: weeklyRevenue,
      revenueByType: revenueByType,
      dailyRevenue: dailyRevenue,
      monthlyRevenue: monthlyRevenue,
    );
  }
}

