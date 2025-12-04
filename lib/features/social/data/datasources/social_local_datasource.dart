import 'dart:convert';
import 'package:hive/hive.dart';
import '../../../../core/database/hive_boxes.dart';
import '../../domain/entities/social_pet_entity.dart';

/// Local datasource for social pets using Hive
abstract class SocialLocalDataSource {
  /// Get cached social pets
  Future<List<SocialPet>> getCachedPets();

  /// Cache social pets
  Future<void> cachePets(List<SocialPet> pets);

  /// Cache a single pet
  Future<void> cachePet(SocialPet pet);

  /// Delete a cached pet
  Future<void> deleteCachedPet(String petId);

  /// Clear all cached pets
  Future<void> clearCache();
}

class SocialLocalDataSourceImpl implements SocialLocalDataSource {
  @override
  Future<List<SocialPet>> getCachedPets() async {
    try {
      final box = Hive.box(HiveBoxes.socialBox);
      return box.values
          .map((dynamic e) => SocialPet.fromJson(jsonDecode(e as String)))
          .toList();
    } catch (e) {
      throw Exception('Failed to get cached pets: $e');
    }
  }

  @override
  Future<void> cachePets(List<SocialPet> pets) async {
    try {
      final box = Hive.box(HiveBoxes.socialBox);
      final Map<String, String> petsMap = {
        for (var pet in pets) pet.id: jsonEncode(pet.toJson()),
      };
      await box.putAll(petsMap);
    } catch (e) {
      throw Exception('Failed to cache pets: $e');
    }
  }

  @override
  Future<void> cachePet(SocialPet pet) async {
    try {
      final box = Hive.box(HiveBoxes.socialBox);
      await box.put(pet.id, jsonEncode(pet.toJson()));
    } catch (e) {
      throw Exception('Failed to cache pet: $e');
    }
  }

  @override
  Future<void> deleteCachedPet(String petId) async {
    try {
      final box = Hive.box(HiveBoxes.socialBox);
      await box.delete(petId);
    } catch (e) {
      throw Exception('Failed to delete cached pet: $e');
    }
  }

  @override
  Future<void> clearCache() async {
    try {
      final box = Hive.box(HiveBoxes.socialBox);
      await box.clear();
    } catch (e) {
      throw Exception('Failed to clear social pets cache: $e');
    }
  }
}

