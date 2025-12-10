// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'explore_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$exploreRepositoryHash() => r'a2ed6a4950fcb49749e38fd0a47a9be2e97e4ebd';

/// See also [exploreRepository].
@ProviderFor(exploreRepository)
final exploreRepositoryProvider = Provider<ExploreRepository>.internal(
  exploreRepository,
  name: r'exploreRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$exploreRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ExploreRepositoryRef = ProviderRef<ExploreRepository>;
String _$exploreControllerHash() => r'bcc475c38f19ac132a234cc550a726e174518cc6';

/// See also [ExploreController].
@ProviderFor(ExploreController)
final exploreControllerProvider =
    AsyncNotifierProvider<ExploreController, void>.internal(
  ExploreController.new,
  name: r'exploreControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$exploreControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ExploreController = AsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
