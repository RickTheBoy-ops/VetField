// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'explore_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$exploreRepositoryHash() => r'ae137bdc29dd1514583ea50908cb629e2d6fb9dd';

/// See also [exploreRepository].
@ProviderFor(exploreRepository)
final exploreRepositoryProvider =
    AutoDisposeProvider<ExploreRepository>.internal(
  exploreRepository,
  name: r'exploreRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$exploreRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ExploreRepositoryRef = AutoDisposeProviderRef<ExploreRepository>;
String _$exploreControllerHash() => r'b512ff12c40aee6f1b7b1a95ede171004910f80c';

/// See also [ExploreController].
@ProviderFor(ExploreController)
final exploreControllerProvider =
    AutoDisposeAsyncNotifierProvider<ExploreController, void>.internal(
  ExploreController.new,
  name: r'exploreControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$exploreControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ExploreController = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
