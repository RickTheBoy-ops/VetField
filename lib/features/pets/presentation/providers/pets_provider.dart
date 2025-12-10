import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/supabase_provider.dart';
import '../../data/datasources/pets_remote_datasource.dart';
import '../../data/repositories/pet_repository_impl.dart';
import '../../domain/repositories/pet_repository.dart';
import '../../domain/entities/pet_entity.dart';
import '../../domain/usecases/get_pets_usecase.dart';
import '../../domain/usecases/add_pet_usecase.dart';
import '../../domain/usecases/update_pet_usecase.dart';
import '../../domain/usecases/delete_pet_usecase.dart';

part 'pets_provider.g.dart';

@Riverpod(keepAlive: true)
PetsRemoteDataSource petsRemoteDataSource(Ref ref) {
  final client = ref.watch(supabaseClientProvider);
  return PetsRemoteDataSourceImpl(client);
}

@Riverpod(keepAlive: true)
PetRepository petRepository(Ref ref) {
  final remote = ref.watch(petsRemoteDataSourceProvider);
  return PetRepositoryImpl(remote);
}

@Riverpod(keepAlive: true)
GetPetsUseCase getPetsUseCase(Ref ref) {
  final repo = ref.watch(petRepositoryProvider);
  return GetPetsUseCase(repo);
}

@Riverpod(keepAlive: true)
AddPetUseCase addPetUseCase(Ref ref) {
  final repo = ref.watch(petRepositoryProvider);
  return AddPetUseCase(repo);
}

@Riverpod(keepAlive: true)
UpdatePetUseCase updatePetUseCase(Ref ref) {
  final repo = ref.watch(petRepositoryProvider);
  return UpdatePetUseCase(repo);
}

@Riverpod(keepAlive: true)
DeletePetUseCase deletePetUseCase(Ref ref) {
  final repo = ref.watch(petRepositoryProvider);
  return DeletePetUseCase(repo);
}

@Riverpod(keepAlive: true)
class MyPetsController extends _$MyPetsController {
  @override
  FutureOr<List<PetEntity>> build() async {
    final client = ref.read(supabaseClientProvider);
    final user = client.auth.currentUser;
    if (user == null) return [];
    final useCase = ref.read(getPetsUseCaseProvider);
    final result = await useCase(user.id);
    return result.fold((f) => [], (list) => list);
  }

  Future<void> add(AddPetParams params) async {
    final useCase = ref.read(addPetUseCaseProvider);
    final result = await useCase(params);
    result.fold((f) {}, (_) => ref.invalidateSelf());
  }

  Future<void> updatePet(UpdatePetParams params) async {
    final useCase = ref.read(updatePetUseCaseProvider);
    final result = await useCase(params);
    result.fold((f) {}, (_) => ref.invalidateSelf());
  }

  Future<void> remove(String id) async {
    final useCase = ref.read(deletePetUseCaseProvider);
    final result = await useCase(DeletePetParams(id));
    result.fold((f) {}, (_) => ref.invalidateSelf());
  }
}
