import 'package:hive_flutter/hive_flutter.dart';

/// Centralized Hive box configuration for offline-first storage
class HiveBoxes {
  // Box names
  static const String pets = 'pets';
  static const String healthRecords = 'health_records';
  static const String prescriptions = 'prescriptions';
  static const String gamificationProgress = 'gamification_progress';
  static const String userPreferences = 'user_preferences';
  static const String appointments = 'appointments';
  static const String vetSchedule = 'vet_schedule';
  static const String socialPosts = 'social_posts';

  /// Initialize all Hive boxes
  static Future<void> init() async {
    await Hive.initFlutter();

    // Register adapters here when generated
    // Example: Hive.registerAdapter(PetEntityAdapter());

    // Open all boxes
    await Future.wait([
      Hive.openBox(pets),
      Hive.openBox(healthRecords),
      Hive.openBox(prescriptions),
      Hive.openBox(gamificationProgress),
      Hive.openBox(userPreferences),
      Hive.openBox(appointments),
      Hive.openBox(vetSchedule),
      Hive.openBox(socialPosts),
    ]);
  }

  /// Get pets box
  static Box getPetsBox() => Hive.box(pets);

  /// Get health records box
  static Box getHealthRecordsBox() => Hive.box(healthRecords);

  /// Get prescriptions box
  static Box getPrescriptionsBox() => Hive.box(prescriptions);

  /// Get gamification progress box
  static Box getGamificationProgressBox() => Hive.box(gamificationProgress);

  /// Get user preferences box
  static Box getUserPreferencesBox() => Hive.box(userPreferences);

  /// Get appointments box
  static Box getAppointmentsBox() => Hive.box(appointments);

  /// Get vet schedule box
  static Box getVetScheduleBox() => Hive.box(vetSchedule);

  /// Get social posts box
  static Box getSocialPostsBox() => Hive.box(socialPosts);

  /// Clear all boxes (useful for logout or testing)
  static Future<void> clearAll() async {
    await Future.wait([
      getPetsBox().clear(),
      getHealthRecordsBox().clear(),
      getPrescriptionsBox().clear(),
      getGamificationProgressBox().clear(),
      getAppointmentsBox().clear(),
      getVetScheduleBox().clear(),
      getSocialPostsBox().clear(),
      // Keep user preferences for onboarding state
    ]);
  }

  /// Close all boxes
  static Future<void> closeAll() async {
    await Hive.close();
  }
}
