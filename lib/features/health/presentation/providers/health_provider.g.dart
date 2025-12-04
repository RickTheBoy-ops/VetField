// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$healthRemoteDataSourceHash() =>
    r'3ffd4f66b37e25021064b1bfb6c651ebb44a5c8b';

/// See also [healthRemoteDataSource].
@ProviderFor(healthRemoteDataSource)
final healthRemoteDataSourceProvider =
    AutoDisposeProvider<HealthRemoteDataSource>.internal(
  healthRemoteDataSource,
  name: r'healthRemoteDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$healthRemoteDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HealthRemoteDataSourceRef
    = AutoDisposeProviderRef<HealthRemoteDataSource>;
String _$healthRepositoryHash() => r'91260a3a31a002d8c4784582337b400c21e9be31';

/// See also [healthRepository].
@ProviderFor(healthRepository)
final healthRepositoryProvider = AutoDisposeProvider<HealthRepository>.internal(
  healthRepository,
  name: r'healthRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$healthRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HealthRepositoryRef = AutoDisposeProviderRef<HealthRepository>;
String _$getHealthEventsUseCaseHash() =>
    r'338d211146c3367e451c39c0db9992b17b85463a';

/// See also [getHealthEventsUseCase].
@ProviderFor(getHealthEventsUseCase)
final getHealthEventsUseCaseProvider =
    AutoDisposeProvider<GetHealthEventsUseCase>.internal(
  getHealthEventsUseCase,
  name: r'getHealthEventsUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getHealthEventsUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetHealthEventsUseCaseRef
    = AutoDisposeProviderRef<GetHealthEventsUseCase>;
String _$addHealthEventUseCaseHash() =>
    r'503ffdf2152294c3d1cd5ce1fc8ba86a7b80732f';

/// See also [addHealthEventUseCase].
@ProviderFor(addHealthEventUseCase)
final addHealthEventUseCaseProvider =
    AutoDisposeProvider<AddHealthEventUseCase>.internal(
  addHealthEventUseCase,
  name: r'addHealthEventUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addHealthEventUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AddHealthEventUseCaseRef
    = AutoDisposeProviderRef<AddHealthEventUseCase>;
String _$healthTimelineControllerHash() =>
    r'0a22b9787e4cf4cbb5adca20cc05f621ca21c78c';

/// See also [HealthTimelineController].
@ProviderFor(HealthTimelineController)
final healthTimelineControllerProvider = AutoDisposeAsyncNotifierProvider<
    HealthTimelineController, List<HealthEventEntity>>.internal(
  HealthTimelineController.new,
  name: r'healthTimelineControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$healthTimelineControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HealthTimelineController
    = AutoDisposeAsyncNotifier<List<HealthEventEntity>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
