import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// Centralized Hive box configuration for offline-first storage
class HiveBoxes {
  // New Box names
  static const String pets = 'pets';
  static const String healthRecords = 'health_records';
  static const String prescriptions = 'prescriptions';
  static const String gamificationProgress = 'gamification_progress';
  static const String userPreferences = 'user_preferences';
  static const String appointments = 'appointments';
  static const String vetSchedule = 'vet_schedule';
  static const String socialPosts = 'social_posts';

  // Legacy Box names (from database/hive_boxes.dart)
  // Mantidos para compatibilidade com código existente
  static const String authBox = 'auth_box';
  static const String petsBox = 'pets_box';
  static const String healthBox = 'health_box';
  static const String appointmentsBox = 'appointments_box';
  static const String gamificationBox = 'gamification_box';
  static const String prescriptionsBox = 'prescriptions_box';

  /// Initialize all Hive boxes
  static Future<void> init() async {
    try {
      await Hive.initFlutter();

      // Pequeno delay para garantir estabilidade na web se necessário
      if (kIsWeb) {
        await Future.delayed(const Duration(milliseconds: 50));
      }

      // Register adapters here when generated
      // Example: Hive.registerAdapter(PetEntityAdapter());

      // Open boxes sequentially to avoid race conditions or browser limits
      // New Boxes
      await _safeOpenBox(pets);
      await _safeOpenBox(healthRecords);
      await _safeOpenBox(prescriptions);
      await _safeOpenBox(gamificationProgress);
      await _safeOpenBox(userPreferences);
      await _safeOpenBox(appointments);
      await _safeOpenBox(vetSchedule);
      await _safeOpenBox(socialPosts);

      // Legacy Boxes (se forem diferentes das novas, abra também)
      // Nota: Se pets e petsBox forem para a mesma finalidade, deveriam ser migrados.
      // Por enquanto, abrimos todas para evitar erros de "Box not found".
      await _safeOpenBox(authBox);
      if (petsBox != pets) await _safeOpenBox(petsBox);
      if (healthBox != healthRecords) await _safeOpenBox(healthBox);
      if (appointmentsBox != appointments) await _safeOpenBox(appointmentsBox);
      if (gamificationBox != gamificationProgress)
        await _safeOpenBox(gamificationBox);
      if (prescriptionsBox != prescriptions)
        await _safeOpenBox(prescriptionsBox);

      debugPrint('Hive initialized successfully with all boxes opened.');
    } catch (e, stack) {
      debugPrint('Error initializing Hive: $e\n$stack');
      rethrow;
    }
  }

  static Future<void> _safeOpenBox(String name) async {
    if (Hive.isBoxOpen(name)) return;
    try {
      await Hive.openBox(name);
    } on HiveError catch (err) {
      if (err.toString().contains('NotInitializedError')) {
        await Hive.initFlutter();
        await Hive.openBox(name);
        return;
      }
      rethrow;
    } catch (e) {
      debugPrint('Hive: failed to open box "$name": $e');
      rethrow;
    }
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
    // Lista de todas as boxes para limpar
    final boxesToClear = [
      pets,
      healthRecords,
      prescriptions,
      gamificationProgress,
      appointments,
      vetSchedule,
      socialPosts,
      authBox,
      petsBox,
      healthBox,
      appointmentsBox,
      gamificationBox,
      prescriptionsBox,
    ];

    // Remover duplicatas
    final uniqueBoxes = boxesToClear.toSet().toList();

    for (var boxName in uniqueBoxes) {
      if (Hive.isBoxOpen(boxName)) {
        await Hive.box(boxName).clear();
      }
    }
    // Keep user preferences for onboarding state intentionally?
    // Se quiser limpar tudo: await Hive.box(userPreferences).clear();
  }

  /// Close all boxes
  static Future<void> closeAll() async {
    await Hive.close();
  }
}
