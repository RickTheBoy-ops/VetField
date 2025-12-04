import 'package:hive/hive.dart';
import '../../domain/entities/appointment_entity.dart';

abstract class AppointmentLocalDataSource {
  Future<List<AppointmentEntity>> getCachedAppointments(String userId);
  Future<void> cacheAppointments(String userId, List<AppointmentEntity> appointments);
  Future<void> clearCache();
}

class AppointmentLocalDataSourceImpl implements AppointmentLocalDataSource {
  static const String _boxName = 'appointments';

  @override
  Future<List<AppointmentEntity>> getCachedAppointments(String userId) async {
    final box = await Hive.openBox('${_boxName}_$userId');
    final values = box.values.cast<Map>().toList();
    return values.map((e) => AppointmentEntity.fromJson(Map<String, dynamic>.from(e))).toList();
  }

  @override
  Future<void> cacheAppointments(String userId, List<AppointmentEntity> appointments) async {
    final box = await Hive.openBox('${_boxName}_$userId');
    await box.clear();
    for (var appointment in appointments) {
      await box.add(appointment.toJson());
    }
  }

  @override
  Future<void> clearCache() async {
    await Hive.deleteBoxFromDisk(_boxName);
  }
}
