import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/pet_model.dart';

abstract class PetsRemoteDataSource {
  Future<List<PetModel>> getPetsByOwner(String ownerId);
  Future<PetModel> addPet(PetModel pet);
  Future<PetModel> updatePet(PetModel pet);
  Future<void> deletePet(String id);
}

class PetsRemoteDataSourceImpl implements PetsRemoteDataSource {
  final SupabaseClient client;

  PetsRemoteDataSourceImpl(this.client);

  @override
  Future<List<PetModel>> getPetsByOwner(String ownerId) async {
    final response = await client
        .from('pets')
        .select()
        .eq('owner_id', ownerId)
        .order('name', ascending: true);
    return (response as List)
        .map((e) => PetModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<PetModel> addPet(PetModel pet) async {
    final user = client.auth.currentUser;
    if (user == null) {
      throw Exception('Usuário não autenticado');
    }
    final payload = pet.copyWith(id: '', ownerId: user.id);
    final inserted = await client
        .from('pets')
        .insert(payload.toJson())
        .select()
        .single();
    return PetModel.fromJson(inserted);
  }

  @override
  Future<PetModel> updatePet(PetModel pet) async {
    final updated = await client
        .from('pets')
        .update(pet.toJson())
        .eq('id', pet.id)
        .select()
        .single();
    return PetModel.fromJson(updated);
  }

  @override
  Future<void> deletePet(String id) async {
    await client.from('pets').delete().eq('id', id);
  }
}

