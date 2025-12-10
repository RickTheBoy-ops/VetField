// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$healthRemoteDataSourceHash() =>
    r'be6aa93eddd02a11a8e589836437de79dba6d3ce';

/// See also [healthRemoteDataSource].
@ProviderFor(healthRemoteDataSource)
final healthRemoteDataSourceProvider =
    Provider<HealthRemoteDataSource>.internal(
  healthRemoteDataSource,
  name: r'healthRemoteDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$healthRemoteDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HealthRemoteDataSourceRef = ProviderRef<HealthRemoteDataSource>;
String _$healthLocalDataSourceHash() =>
    r'6dc24fbf79dd6d549506406a5bc1fc78098a6ee0';

/// See also [healthLocalDataSource].
@ProviderFor(healthLocalDataSource)
final healthLocalDataSourceProvider = Provider<HealthLocalDataSource>.internal(
  healthLocalDataSource,
  name: r'healthLocalDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$healthLocalDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HealthLocalDataSourceRef = ProviderRef<HealthLocalDataSource>;
String _$healthRepositoryHash() => r'958b6f88cb31573860d84c2f153521c16f365360';

/// See also [healthRepository].
@ProviderFor(healthRepository)
final healthRepositoryProvider = Provider<HealthRepository>.internal(
  healthRepository,
  name: r'healthRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$healthRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HealthRepositoryRef = ProviderRef<HealthRepository>;
String _$getHealthEventsUseCaseHash() =>
    r'0c8e436cf329c39a51c83d9090a0f4c561befa77';

/// See also [getHealthEventsUseCase].
@ProviderFor(getHealthEventsUseCase)
final getHealthEventsUseCaseProvider =
    Provider<GetHealthEventsUseCase>.internal(
  getHealthEventsUseCase,
  name: r'getHealthEventsUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getHealthEventsUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetHealthEventsUseCaseRef = ProviderRef<GetHealthEventsUseCase>;
String _$addHealthEventUseCaseHash() =>
    r'b5153d3f6238d0dd1ce3b462f5b52fb5fdd55c92';

/// See also [addHealthEventUseCase].
@ProviderFor(addHealthEventUseCase)
final addHealthEventUseCaseProvider = Provider<AddHealthEventUseCase>.internal(
  addHealthEventUseCase,
  name: r'addHealthEventUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addHealthEventUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AddHealthEventUseCaseRef = ProviderRef<AddHealthEventUseCase>;
String _$healthTimelineControllerHash() =>
    r'492105053e70bde1e5e4bf73f435b7dd14ab8a8f';

/// See also [HealthTimelineController].
@ProviderFor(HealthTimelineController)
final healthTimelineControllerProvider = AsyncNotifierProvider<
    HealthTimelineController, List<HealthEventEntity>>.internal(
  HealthTimelineController.new,
  name: r'healthTimelineControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$healthTimelineControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HealthTimelineController = AsyncNotifier<List<HealthEventEntity>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
