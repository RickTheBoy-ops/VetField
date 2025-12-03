import 'package:hive/hive.dart';
import '../models/appointment_model.dart';

abstract class AppointmentLocalDataSource {
  Future<List<AppointmentModel>> getCachedAppointments(String userId);
  Future<void> cacheAppointments(String userId, List<AppointmentModel> appointments);
  Future<void> clearCache();
}

class AppointmentLocalDataSourceImpl implements AppointmentLocalDataSource {
  static const String _boxName = 'appointments';

  @override
  Future<List<AppointmentModel>> getCachedAppointments(String userId) async {
    final box = await Hive.openBox<AppointmentModel>('${_boxName}_$userId');
    return box.values.toList();
  }

  @override
  Future<void> cacheAppointments(String userId, List<AppointmentModel> appointments) async {
    final box = await Hive.openBox<AppointmentModel>('${_boxName}_$userId');
    await box.clear();
    for (var appointment in appointments) {
      await box.add(appointment);
    }
  }

  @override
  Future<void> clearCache() async {
    await Hive.deleteBoxFromDisk(_boxName);
  }
}
