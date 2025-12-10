// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vet_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$vetRemoteDataSourceHash() =>
    r'12cd41117d3a03e3229cd603b3b27543ad236cb6';

/// See also [vetRemoteDataSource].
@ProviderFor(vetRemoteDataSource)
final vetRemoteDataSourceProvider = Provider<VetRemoteDataSource>.internal(
  vetRemoteDataSource,
  name: r'vetRemoteDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$vetRemoteDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef VetRemoteDataSourceRef = ProviderRef<VetRemoteDataSource>;
String _$ownerLocalDataSourceHash() =>
    r'9393b7dfac0852b7136cb1526c1070445cfae602';

/// See also [ownerLocalDataSource].
@ProviderFor(ownerLocalDataSource)
final ownerLocalDataSourceProvider = Provider<OwnerLocalDataSource>.internal(
  ownerLocalDataSource,
  name: r'ownerLocalDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$ownerLocalDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef OwnerLocalDataSourceRef = ProviderRef<OwnerLocalDataSource>;
String _$vetRepositoryHash() => r'fa9439f212b1e12fc1a28a127200f55862d22636';

/// See also [vetRepository].
@ProviderFor(vetRepository)
final vetRepositoryProvider = Provider<VetRepository>.internal(
  vetRepository,
  name: r'vetRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$vetRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef VetRepositoryRef = ProviderRef<VetRepository>;
String _$getNearbyVetsUseCaseHash() =>
    r'01b03eb7b275e9042f47cd7a98bf750dae43ce41';

/// See also [getNearbyVetsUseCase].
@ProviderFor(getNearbyVetsUseCase)
final getNearbyVetsUseCaseProvider = Provider<GetNearbyVetsUseCase>.internal(
  getNearbyVetsUseCase,
  name: r'getNearbyVetsUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getNearbyVetsUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetNearbyVetsUseCaseRef = ProviderRef<GetNearbyVetsUseCase>;
String _$getSosNearestVetUseCaseHash() =>
    r'b57741b9aaf439a559f3260bc84399b455f8c5ba';

/// See also [getSosNearestVetUseCase].
@ProviderFor(getSosNearestVetUseCase)
final getSosNearestVetUseCaseProvider =
    Provider<GetSosNearestVetUseCase>.internal(
  getSosNearestVetUseCase,
  name: r'getSosNearestVetUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getSosNearestVetUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetSosNearestVetUseCaseRef = ProviderRef<GetSosNearestVetUseCase>;
String _$nearbyVetsControllerHash() =>
    r'c1c29739819e10e5465369d9f2c939f92a136dd2';

/// See also [NearbyVetsController].
@ProviderFor(NearbyVetsController)
final nearbyVetsControllerProvider =
    AsyncNotifierProvider<NearbyVetsController, List<VetEntity>>.internal(
  NearbyVetsController.new,
  name: r'nearbyVetsControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$nearbyVetsControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NearbyVetsController = AsyncNotifier<List<VetEntity>>;
String _$searchVetsControllerHash() =>
    r'95338e9e0da0326a30301710fa88232832245c12';

/// See also [SearchVetsController].
@ProviderFor(SearchVetsController)
final searchVetsControllerProvider =
    AsyncNotifierProvider<SearchVetsController, List<VetEntity>>.internal(
  SearchVetsController.new,
  name: r'searchVetsControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$searchVetsControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchVetsController = AsyncNotifier<List<VetEntity>>;
String _$sosNearestVetControllerHash() =>
    r'de10d37579f60fa626f0ff0e403fdaed0bb941c1';

/// See also [SosNearestVetController].
@ProviderFor(SosNearestVetController)
final sosNearestVetControllerProvider =
    AsyncNotifierProvider<SosNearestVetController, VetEntity?>.internal(
  SosNearestVetController.new,
  name: r'sosNearestVetControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sosNearestVetControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SosNearestVetController = AsyncNotifier<VetEntity?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
