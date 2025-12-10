import 'dart:convert';
import 'package:hive/hive.dart';
import '../../../../core/local/hive_boxes.dart';
import '../../domain/entities/gamification_entities.dart';

/// Local datasource for gamification progress using Hive
abstract class GamificationLocalDataSource {
  /// Get cached user profile
  Future<GamificationProfile?> getCachedProfile();

  /// Cache user profile
  Future<void> cacheProfile(GamificationProfile profile);

  /// Clear all gamification cache
  Future<void> clearCache();
}

class GamificationLocalDataSourceImpl implements GamificationLocalDataSource {
  static const String _profileKey = 'profile';

  @override
  Future<GamificationProfile?> getCachedProfile() async {
    try {
      final box = Hive.box(HiveBoxes.gamificationBox);
      final jsonString = box.get(_profileKey);
      if (jsonString != null) {
        return GamificationProfile.fromJson(jsonDecode(jsonString));
      }
      return null;
    } catch (e) {
      throw Exception('Failed to get cached profile: $e');
    }
  }

  @override
  Future<void> cacheProfile(GamificationProfile profile) async {
    try {
      final box = Hive.box(HiveBoxes.gamificationBox);
      await box.put(_profileKey, jsonEncode(profile.toJson()));
    } catch (e) {
      throw Exception('Failed to cache profile: $e');
    }
  }

  @override
  Future<void> clearCache() async {
    try {
      final box = Hive.box(HiveBoxes.gamificationBox);
      await box.clear();
    } catch (e) {
      throw Exception('Failed to clear gamification cache: $e');
    }
  }
}

