import 'package:hive/hive.dart';
import '../../domain/entities/vet_entity.dart';

abstract class OwnerLocalDataSource {
  Future<List<VetEntity>> getCachedVets();
  Future<void> cacheVets(List<VetEntity> vets);
  Future<void> clearCache();
}

class OwnerLocalDataSourceImpl implements OwnerLocalDataSource {
  static const String _boxName = 'owner_vets_cache';

  @override
  Future<List<VetEntity>> getCachedVets() async {
    final box = await Hive.openBox(_boxName);
    final values = box.values.cast<Map>().toList();
    return values.map((e) => VetEntity.fromJson(Map<String, dynamic>.from(e))).toList();
  }

  @override
  Future<void> cacheVets(List<VetEntity> vets) async {
    final box = await Hive.openBox(_boxName);
    await box.clear();
    for (var vet in vets) {
      await box.add(vet.toJson());
    }
  }

  @override
  Future<void> clearCache() async {
    await Hive.deleteBoxFromDisk(_boxName);
  }
}
