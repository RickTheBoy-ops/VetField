import 'package:flutter_test/flutter_test.dart';
import 'package:vetfield_flutter/features/appointment/domain/entities/appointment_entity.dart';
import 'package:vetfield_flutter/features/vet/data/models/vet_statistics_model.dart';

void main() {
  group('VetStatisticsModel', () {
    late List<AppointmentEntity> testAppointments;

    setUp(() {
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);

      testAppointments = [
        AppointmentEntity(
          id: '1',
          vetId: 'vet1',
          ownerId: 'owner1',
          petId: 'pet1',
          petName: 'Rex',
          dateTime: today, // Today
          type: AppointmentType.consultation,
          status: AppointmentStatus.confirmed,
          price: 150.0,
        ),
        AppointmentEntity(
          id: '2',
          vetId: 'vet1',
          ownerId: 'owner2',
          petId: 'pet2',
          petName: 'Luna',
          dateTime: today.subtract(const Duration(days: 1)), // Yesterday
          type: AppointmentType.vaccine,
          status: AppointmentStatus.completed,
          price: 100.0,
        ),
        AppointmentEntity(
          id: '3',
          vetId: 'vet1',
          ownerId: 'owner3',
          petId: 'pet3',
          petName: 'Max',
          dateTime: today.subtract(const Duration(days: 30)), // Last month
          type: AppointmentType.exam,
          status: AppointmentStatus.completed,
          price: 200.0,
        ),
        AppointmentEntity(
          id: '4',
          vetId: 'vet1',
          ownerId: 'owner4',
          petId: 'pet4',
          petName: 'Bella',
          dateTime: today,
          type: AppointmentType.surgery,
          status: AppointmentStatus.cancelled, // Should be excluded
          price: 500.0,
        ),
      ];
    });

    test('should compute today appointments count correctly', () {
      final stats = VetStatisticsModel.fromAppointments(testAppointments);

      expect(stats.todayAppointments, 1); // Only 1 non-cancelled today
    });

    test('should compute weekly revenue correctly', () {
      final stats = VetStatisticsModel.fromAppointments(testAppointments);

      expect(stats.weeklyRevenue, 250.0); // 150 + 100 (last 7 days)
    });

    test('should compute revenue by type correctly', () {
      final stats = VetStatisticsModel.fromAppointments(testAppointments);

      expect(stats.revenueByType[AppointmentType.consultation], 150.0);
      expect(stats.revenueByType[AppointmentType.vaccine], 100.0);
      expect(stats.revenueByType[AppointmentType.exam], 200.0);
      expect(stats.revenueByType[AppointmentType.surgery], 0.0); // Cancelled
    });

    test('should compute daily revenue for last 7 days', () {
      final stats = VetStatisticsModel.fromAppointments(testAppointments);

      expect(stats.dailyRevenue.length, 7);
      expect(stats.dailyRevenue.last, 150.0); // Today
      expect(stats.dailyRevenue[stats.dailyRevenue.length - 2], 100.0); // Yesterday
    });

    test('should exclude cancelled appointments from statistics', () {
      final stats = VetStatisticsModel.fromAppointments(testAppointments);

      // Total revenue should not include cancelled appointment
      final totalRevenue = stats.revenueByType.values.fold(0.0, (sum, val) => sum + val);
      expect(totalRevenue, 450.0); // 150 + 100 + 200 (no 500 from cancelled)
    });

    test('should handle empty appointments list', () {
      final stats = VetStatisticsModel.fromAppointments([]);

      expect(stats.todayAppointments, 0);
      expect(stats.weeklyRevenue, 0.0);
      expect(stats.dailyRevenue.every((val) => val == 0), isTrue);
      expect(stats.monthlyRevenue.every((val) => val == 0), isTrue);
    });
  });
}
