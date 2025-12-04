// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vet_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$vetRemoteDataSourceHash() =>
    r'ee9c50a53c4c379723d13df8efd6dbea5e00a138';

/// See also [vetRemoteDataSource].
@ProviderFor(vetRemoteDataSource)
final vetRemoteDataSourceProvider =
    AutoDisposeProvider<VetRemoteDataSource>.internal(
  vetRemoteDataSource,
  name: r'vetRemoteDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$vetRemoteDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef VetRemoteDataSourceRef = AutoDisposeProviderRef<VetRemoteDataSource>;
String _$ownerLocalDataSourceHash() =>
    r'1c29c7fb6c281b7cb17a9f07d6aa51de28f6cd2c';

/// See also [ownerLocalDataSource].
@ProviderFor(ownerLocalDataSource)
final ownerLocalDataSourceProvider =
    AutoDisposeProvider<OwnerLocalDataSource>.internal(
  ownerLocalDataSource,
  name: r'ownerLocalDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$ownerLocalDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef OwnerLocalDataSourceRef = AutoDisposeProviderRef<OwnerLocalDataSource>;
String _$vetRepositoryHash() => r'88222291f7e0681e952e8f1006c9c059502da724';

/// See also [vetRepository].
@ProviderFor(vetRepository)
final vetRepositoryProvider = AutoDisposeProvider<VetRepository>.internal(
  vetRepository,
  name: r'vetRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$vetRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef VetRepositoryRef = AutoDisposeProviderRef<VetRepository>;
String _$getNearbyVetsUseCaseHash() =>
    r'8f8a2019e9984ffb06bb3c9076fe1eb2497f0ca7';

/// See also [getNearbyVetsUseCase].
@ProviderFor(getNearbyVetsUseCase)
final getNearbyVetsUseCaseProvider =
    AutoDisposeProvider<GetNearbyVetsUseCase>.internal(
  getNearbyVetsUseCase,
  name: r'getNearbyVetsUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getNearbyVetsUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetNearbyVetsUseCaseRef = AutoDisposeProviderRef<GetNearbyVetsUseCase>;
String _$getSosNearestVetUseCaseHash() =>
    r'f25690213d97265701288f3eb3c82285c5c0adb5';

/// See also [getSosNearestVetUseCase].
@ProviderFor(getSosNearestVetUseCase)
final getSosNearestVetUseCaseProvider =
    AutoDisposeProvider<GetSosNearestVetUseCase>.internal(
  getSosNearestVetUseCase,
  name: r'getSosNearestVetUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getSosNearestVetUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetSosNearestVetUseCaseRef
    = AutoDisposeProviderRef<GetSosNearestVetUseCase>;
String _$nearbyVetsControllerHash() =>
    r'7e643b76cd58a471fca3b2c3401d2500ac4f59c3';

/// See also [NearbyVetsController].
@ProviderFor(NearbyVetsController)
final nearbyVetsControllerProvider = AutoDisposeAsyncNotifierProvider<
    NearbyVetsController, List<VetEntity>>.internal(
  NearbyVetsController.new,
  name: r'nearbyVetsControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$nearbyVetsControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NearbyVetsController = AutoDisposeAsyncNotifier<List<VetEntity>>;
String _$searchVetsControllerHash() =>
    r'39d4c574c8c70c309dc53e24f7d22069fc321463';

/// See also [SearchVetsController].
@ProviderFor(SearchVetsController)
final searchVetsControllerProvider = AutoDisposeAsyncNotifierProvider<
    SearchVetsController, List<VetEntity>>.internal(
  SearchVetsController.new,
  name: r'searchVetsControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$searchVetsControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchVetsController = AutoDisposeAsyncNotifier<List<VetEntity>>;
String _$sosNearestVetControllerHash() =>
    r'6d2ecdc7c2b480bb8c93863b5a459efe7c02db38';

/// See also [SosNearestVetController].
@ProviderFor(SosNearestVetController)
final sosNearestVetControllerProvider = AutoDisposeAsyncNotifierProvider<
    SosNearestVetController, VetEntity?>.internal(
  SosNearestVetController.new,
  name: r'sosNearestVetControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sosNearestVetControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SosNearestVetController = AutoDisposeAsyncNotifier<VetEntity?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
