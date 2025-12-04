import '../../../../core/local/hive_boxes.dart';
import '../models/pet_model.dart';

/// Local datasource for pets using Hive
abstract class PetsLocalDataSource {
  /// Get all pets for the current user from cache
  Future<List<PetModel>> getCachedPets();

  /// Get a specific pet by ID from cache
  Future<PetModel?> getCachedPet(String petId);

  /// Cache a list of pets
  Future<void> cachePets(List<PetModel> pets);

  /// Cache a single pet
  Future<void> cachePet(PetModel pet);

  /// Delete a pet from cache
  Future<void> deleteCachedPet(String petId);

  /// Clear all cached pets
  Future<void> clearCache();
}

class PetsLocalDataSourceImpl implements PetsLocalDataSource {
  @override
  Future<List<PetModel>> getCachedPets() async {
    try {
      final box = HiveBoxes.getPetsBox();
      final pets = box.values
          .map((dynamic e) => PetModel.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList();
      return pets;
    } catch (e) {
      throw Exception('Failed to get cached pets: $e');
    }
  }

  @override
  Future<PetModel?> getCachedPet(String petId) async {
    try {
      final box = HiveBoxes.getPetsBox();
      final petData = box.get(petId);
      if (petData == null) return null;
      
      return PetModel.fromJson(Map<String, dynamic>.from(petData as Map));
    } catch (e) {
      throw Exception('Failed to get cached pet: $e');
    }
  }

  @override
  Future<void> cachePets(List<PetModel> pets) async {
    try {
      final box = HiveBoxes.getPetsBox();
      final Map<String, dynamic> petsMap = {
        for (var pet in pets) pet.id: pet.toJson(),
      };
      await box.putAll(petsMap);
    } catch (e) {
      throw Exception('Failed to cache pets: $e');
    }
  }

  @override
  Future<void> cachePet(PetModel pet) async {
    try {
      final box = HiveBoxes.getPetsBox();
      await box.put(pet.id, pet.toJson());
    } catch (e) {
      throw Exception('Failed to cache pet: $e');
    }
  }

  @override
  Future<void> deleteCachedPet(String petId) async {
    try {
      final box = HiveBoxes.getPetsBox();
      await box.delete(petId);
    } catch (e) {
      throw Exception('Failed to delete cached pet: $e');
    }
  }

  @override
  Future<void> clearCache() async {
    try {
      final box = HiveBoxes.getPetsBox();
      await box.clear();
    } catch (e) {
      throw Exception('Failed to clear pets cache: $e');
    }
  }
}
