// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pets_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$petsRemoteDataSourceHash() =>
    r'4ded9ba4e2a7eaa404ccb72c28da2af8e1508444';

/// See also [petsRemoteDataSource].
@ProviderFor(petsRemoteDataSource)
final petsRemoteDataSourceProvider = Provider<PetsRemoteDataSource>.internal(
  petsRemoteDataSource,
  name: r'petsRemoteDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$petsRemoteDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PetsRemoteDataSourceRef = ProviderRef<PetsRemoteDataSource>;
String _$petRepositoryHash() => r'dc1210b1349b19a11ee1cc88fda36d428c4ff4da';

/// See also [petRepository].
@ProviderFor(petRepository)
final petRepositoryProvider = Provider<PetRepository>.internal(
  petRepository,
  name: r'petRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$petRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PetRepositoryRef = ProviderRef<PetRepository>;
String _$getPetsUseCaseHash() => r'ad90278d626094c0f9325b5d1deb3a150e2b4c14';

/// See also [getPetsUseCase].
@ProviderFor(getPetsUseCase)
final getPetsUseCaseProvider = Provider<GetPetsUseCase>.internal(
  getPetsUseCase,
  name: r'getPetsUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getPetsUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetPetsUseCaseRef = ProviderRef<GetPetsUseCase>;
String _$addPetUseCaseHash() => r'ecd9ba9dc6399cb915e06982a10b23a7bcef3e6b';

/// See also [addPetUseCase].
@ProviderFor(addPetUseCase)
final addPetUseCaseProvider = Provider<AddPetUseCase>.internal(
  addPetUseCase,
  name: r'addPetUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addPetUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AddPetUseCaseRef = ProviderRef<AddPetUseCase>;
String _$updatePetUseCaseHash() => r'1656632233d8819ddd4b9828a297ad3502e49a16';

/// See also [updatePetUseCase].
@ProviderFor(updatePetUseCase)
final updatePetUseCaseProvider = Provider<UpdatePetUseCase>.internal(
  updatePetUseCase,
  name: r'updatePetUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$updatePetUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UpdatePetUseCaseRef = ProviderRef<UpdatePetUseCase>;
String _$deletePetUseCaseHash() => r'a1bca338d47bf8e90c8f5406227365326879d393';

/// See also [deletePetUseCase].
@ProviderFor(deletePetUseCase)
final deletePetUseCaseProvider = Provider<DeletePetUseCase>.internal(
  deletePetUseCase,
  name: r'deletePetUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$deletePetUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DeletePetUseCaseRef = ProviderRef<DeletePetUseCase>;
String _$myPetsControllerHash() => r'6bb2e144435ca51a319075f6fdd55e2d1359bbf6';

/// See also [MyPetsController].
@ProviderFor(MyPetsController)
final myPetsControllerProvider =
    AsyncNotifierProvider<MyPetsController, List<PetEntity>>.internal(
  MyPetsController.new,
  name: r'myPetsControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$myPetsControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MyPetsController = AsyncNotifier<List<PetEntity>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
