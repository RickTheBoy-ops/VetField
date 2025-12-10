import 'package:supabase_flutter/supabase_flutter.dart';
import '../../domain/entities/vet_statistics.dart';
import '../../../appointment/domain/entities/appointment_entity.dart';

abstract class VetRemoteDataSource {
  Future<VetStatistics> getStatistics(String vetId);
  Future<void> updateServiceInfo({
    required String vetId,
    String? specialty,
    double? price,
    String? address,
    double? latitude,
    double? longitude,
    bool? isAvailable,
  });
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

    final appointments = (response as List)
        .map((json) => AppointmentEntity.fromJson(json))
        .toList();

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

  @override
  Future<void> updateServiceInfo({
    required String vetId,
    String? specialty,
    double? price,
    String? address,
    double? latitude,
    double? longitude,
    bool? isAvailable,
  }) async {
    final Map<String, dynamic> updates = {};
    if (specialty != null) updates['specialty'] = specialty;
    if (price != null) updates['price'] = price;
    if (address != null) updates['address'] = address;
    if (latitude != null) updates['latitude'] = latitude;
    if (longitude != null) updates['longitude'] = longitude;
    if (isAvailable != null) updates['is_available'] = isAvailable;

    if (updates.isEmpty) return;

    // First try to update
    final response = await supabaseClient
        .from('vets')
        .update(updates)
        .eq('id', vetId)
        .select();

    // If no row updated, maybe insert? Usually vet profile exists after register.
    // But if 'vets' table is separate from 'auth.users' and wasn't created, we might need upsert.
    // Using upsert is safer.
    if ((response as List).isEmpty) {
      // We need 'id' to upsert.
      updates['id'] = vetId;
      // Upsert requires all non-nullable fields if it's a new row.
      // Assuming the user provided enough info or we can't create it fully.
      // Let's try update first as standard flow. If it fails (not found), we might throw or upsert.
      // For now, let's assume the row exists (created at registration trigger or hook).
      throw Exception('Vet profile not found for id: $vetId');
    }
  }
}
