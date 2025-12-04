import '../../../../core/database/hive_boxes.dart';
import '../../domain/entities/health_event_entity.dart';
import 'package:hive/hive.dart';

/// Local datasource for health records using Hive
abstract class HealthLocalDataSource {
  /// Get all health records for a pet from cache
  Future<List<HealthEventEntity>> getCachedHealthRecords(String petId);

  /// Get a specific health record by ID from cache
  Future<HealthEventEntity?> getCachedHealthRecord(String recordId);

  /// Cache a list of health records
  Future<void> cacheHealthRecords(List<HealthEventEntity> records);

  /// Cache a single health record
  Future<void> cacheHealthRecord(HealthEventEntity record);

  /// Delete a health record from cache
  Future<void> deleteCachedHealthRecord(String recordId);

  /// Clear all cached health records
  Future<void> clearCache();
}

class HealthLocalDataSourceImpl implements HealthLocalDataSource {
  @override
  Future<List<HealthEventEntity>> getCachedHealthRecords(String petId) async {
    try {
      final box = Hive.box(HiveBoxes.healthBox);
      final allRecords = box.values
          .map((dynamic e) => HealthEventEntity.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList();
      
      // Filter records by petId
      return allRecords.where((record) => record.petId == petId).toList();
    } catch (e) {
      throw Exception('Failed to get cached health records: $e');
    }
  }

  @override
  Future<HealthEventEntity?> getCachedHealthRecord(String recordId) async {
    try {
      final box = Hive.box(HiveBoxes.healthBox);
      final recordData = box.get(recordId);
      if (recordData == null) return null;
      
      return HealthEventEntity.fromJson(Map<String, dynamic>.from(recordData as Map));
    } catch (e) {
      throw Exception('Failed to get cached health record: $e');
    }
  }

  @override
  Future<void> cacheHealthRecords(List<HealthEventEntity> records) async {
    try {
      final box = Hive.box(HiveBoxes.healthBox);
      final Map<String, dynamic> recordsMap = {
        for (var record in records) record.id: record.toJson(),
      };
      await box.putAll(recordsMap);
    } catch (e) {
      throw Exception('Failed to cache health records: $e');
    }
  }

  @override
  Future<void> cacheHealthRecord(HealthEventEntity record) async {
    try {
      final box = Hive.box(HiveBoxes.healthBox);
      await box.put(record.id, record.toJson());
    } catch (e) {
      throw Exception('Failed to cache health record: $e');
    }
  }

  @override
  Future<void> deleteCachedHealthRecord(String recordId) async {
    try {
      final box = Hive.box(HiveBoxes.healthBox);
      await box.delete(recordId);
    } catch (e) {
      throw Exception('Failed to delete cached health record: $e');
    }
  }

  @override
  Future<void> clearCache() async {
    try {
      final box = Hive.box(HiveBoxes.healthBox);
      await box.clear();
    } catch (e) {
      throw Exception('Failed to clear health records cache: $e');
    }
  }
}

