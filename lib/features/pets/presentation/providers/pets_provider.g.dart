// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pets_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$petsRemoteDataSourceHash() =>
    r'05cfc1ee64b4032ac30e9c96485245421c097d84';

/// See also [petsRemoteDataSource].
@ProviderFor(petsRemoteDataSource)
final petsRemoteDataSourceProvider =
    AutoDisposeProvider<PetsRemoteDataSource>.internal(
      petsRemoteDataSource,
      name: r'petsRemoteDataSourceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$petsRemoteDataSourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PetsRemoteDataSourceRef = AutoDisposeProviderRef<PetsRemoteDataSource>;
String _$petRepositoryHash() => r'029a1fe2536b3e8d1926d9fe93ab968209311b22';

/// See also [petRepository].
@ProviderFor(petRepository)
final petRepositoryProvider = AutoDisposeProvider<PetRepository>.internal(
  petRepository,
  name: r'petRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$petRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PetRepositoryRef = AutoDisposeProviderRef<PetRepository>;
String _$getPetsUseCaseHash() => r'2d09082eab8993f71f7ec3550b22f3a7af33f46e';

/// See also [getPetsUseCase].
@ProviderFor(getPetsUseCase)
final getPetsUseCaseProvider = AutoDisposeProvider<GetPetsUseCase>.internal(
  getPetsUseCase,
  name: r'getPetsUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getPetsUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetPetsUseCaseRef = AutoDisposeProviderRef<GetPetsUseCase>;
String _$addPetUseCaseHash() => r'a3a5b1d7f64fa81a2efc50d16970632eef4d08cb';

/// See also [addPetUseCase].
@ProviderFor(addPetUseCase)
final addPetUseCaseProvider = AutoDisposeProvider<AddPetUseCase>.internal(
  addPetUseCase,
  name: r'addPetUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addPetUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AddPetUseCaseRef = AutoDisposeProviderRef<AddPetUseCase>;
String _$updatePetUseCaseHash() => r'27fe06cc17b9b41c607781faef0296b465fb0643';

/// See also [updatePetUseCase].
@ProviderFor(updatePetUseCase)
final updatePetUseCaseProvider = AutoDisposeProvider<UpdatePetUseCase>.internal(
  updatePetUseCase,
  name: r'updatePetUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$updatePetUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UpdatePetUseCaseRef = AutoDisposeProviderRef<UpdatePetUseCase>;
String _$deletePetUseCaseHash() => r'd077219cdd68950f674def21981abbdc1eddf818';

/// See also [deletePetUseCase].
@ProviderFor(deletePetUseCase)
final deletePetUseCaseProvider = AutoDisposeProvider<DeletePetUseCase>.internal(
  deletePetUseCase,
  name: r'deletePetUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$deletePetUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DeletePetUseCaseRef = AutoDisposeProviderRef<DeletePetUseCase>;
String _$myPetsControllerHash() => r'6de3178dad07ed959ab1605fdc988d90928a010e';

/// See also [MyPetsController].
@ProviderFor(MyPetsController)
final myPetsControllerProvider =
    AutoDisposeAsyncNotifierProvider<
      MyPetsController,
      List<PetEntity>
    >.internal(
      MyPetsController.new,
      name: r'myPetsControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$myPetsControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$MyPetsController = AutoDisposeAsyncNotifier<List<PetEntity>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
