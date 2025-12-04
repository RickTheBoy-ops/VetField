// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$socialRemoteDataSourceHash() =>
    r'c24cbb1bbf7beaad0eb2201c562d406d992c61ca';

/// See also [socialRemoteDataSource].
@ProviderFor(socialRemoteDataSource)
final socialRemoteDataSourceProvider =
    AutoDisposeProvider<SocialRemoteDataSource>.internal(
  socialRemoteDataSource,
  name: r'socialRemoteDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$socialRemoteDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SocialRemoteDataSourceRef
    = AutoDisposeProviderRef<SocialRemoteDataSource>;
String _$socialLocalDataSourceHash() =>
    r'aa6dc9a14cbe78db5b631b37ca96c8d753cf4ded';

/// See also [socialLocalDataSource].
@ProviderFor(socialLocalDataSource)
final socialLocalDataSourceProvider =
    AutoDisposeProvider<SocialLocalDataSource>.internal(
  socialLocalDataSource,
  name: r'socialLocalDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$socialLocalDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SocialLocalDataSourceRef
    = AutoDisposeProviderRef<SocialLocalDataSource>;
String _$socialRepositoryHash() => r'35305ccc1266736b6f3def09f93f36182d437210';

/// See also [socialRepository].
@ProviderFor(socialRepository)
final socialRepositoryProvider = AutoDisposeProvider<SocialRepository>.internal(
  socialRepository,
  name: r'socialRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$socialRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SocialRepositoryRef = AutoDisposeProviderRef<SocialRepository>;
String _$socialControllerHash() => r'5bb871faf10051a58f0da08c5238584160924ed5';

/// See also [SocialController].
@ProviderFor(SocialController)
final socialControllerProvider = AutoDisposeAsyncNotifierProvider<
    SocialController, List<SocialPet>>.internal(
  SocialController.new,
  name: r'socialControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$socialControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SocialController = AutoDisposeAsyncNotifier<List<SocialPet>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
