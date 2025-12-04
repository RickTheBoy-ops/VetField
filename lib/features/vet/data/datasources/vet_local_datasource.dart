import 'dart:convert';
import 'package:hive/hive.dart';
import '../../domain/entities/vet_statistics.dart';

abstract class VetLocalDataSource {
  Future<VetStatistics> getCachedStatistics(String vetId);
  Future<void> cacheStatistics(String vetId, VetStatistics statistics);
  Future<void> clearCache();
}

class VetLocalDataSourceImpl implements VetLocalDataSource {
  static const String _boxName = 'vet_stats_cache';

  @override
  Future<VetStatistics> getCachedStatistics(String vetId) async {
    final box = await Hive.openBox(_boxName);
    final jsonString = box.get(vetId);
    if (jsonString != null) {
      return VetStatistics.fromJson(jsonDecode(jsonString));
    }
    throw Exception('Cache empty');
  }

  @override
  Future<void> cacheStatistics(String vetId, VetStatistics statistics) async {
    final box = await Hive.openBox(_boxName);
    await box.put(vetId, jsonEncode(statistics.toJson()));
  }

  @override
  Future<void> clearCache() async {
    await Hive.deleteBoxFromDisk(_boxName);
  }
}
