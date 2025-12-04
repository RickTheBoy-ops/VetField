import 'package:hive_flutter/hive_flutter.dart';

class HiveBoxes {
  static const String authBox = 'auth_box';
  static const String petsBox = 'pets_box';
  static const String healthBox = 'health_box';
  static const String appointmentsBox = 'appointments_box';
  static const String gamificationBox = 'gamification_box';
  static const String prescriptionsBox = 'prescriptions_box';

  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(authBox);
    await Hive.openBox(petsBox);
    await Hive.openBox(healthBox);
    await Hive.openBox(appointmentsBox);
    await Hive.openBox(gamificationBox);
    await Hive.openBox(prescriptionsBox);
  }
}
