// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gamification_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$gamificationRemoteDataSourceHash() =>
    r'75ddc4ca3e43740bcd4b635c48bbb96a0e8b02b3';

/// See also [gamificationRemoteDataSource].
@ProviderFor(gamificationRemoteDataSource)
final gamificationRemoteDataSourceProvider =
    AutoDisposeProvider<GamificationRemoteDataSource>.internal(
  gamificationRemoteDataSource,
  name: r'gamificationRemoteDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$gamificationRemoteDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GamificationRemoteDataSourceRef
    = AutoDisposeProviderRef<GamificationRemoteDataSource>;
String _$gamificationRepositoryHash() =>
    r'574a5ebadd78eab38689f3ddb09ae4cf05ccd11f';

/// See also [gamificationRepository].
@ProviderFor(gamificationRepository)
final gamificationRepositoryProvider =
    AutoDisposeProvider<GamificationRepository>.internal(
  gamificationRepository,
  name: r'gamificationRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$gamificationRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GamificationRepositoryRef
    = AutoDisposeProviderRef<GamificationRepository>;
String _$userGamificationProfileHash() =>
    r'7d836ea2808b39df1a304977f1dc3a6974f87018';

/// See also [userGamificationProfile].
@ProviderFor(userGamificationProfile)
final userGamificationProfileProvider =
    AutoDisposeFutureProvider<GamificationProfile>.internal(
  userGamificationProfile,
  name: r'userGamificationProfileProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userGamificationProfileHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserGamificationProfileRef
    = AutoDisposeFutureProviderRef<GamificationProfile>;
String _$userTransactionHistoryHash() =>
    r'8e5a4eea850126e7627031844a1576f8d9cc0db9';

/// See also [userTransactionHistory].
@ProviderFor(userTransactionHistory)
final userTransactionHistoryProvider =
    AutoDisposeFutureProvider<List<PointTransaction>>.internal(
  userTransactionHistory,
  name: r'userTransactionHistoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userTransactionHistoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserTransactionHistoryRef
    = AutoDisposeFutureProviderRef<List<PointTransaction>>;
String _$leaderboardProviderHash() =>
    r'ecf127d6a692351f3b001799855b50ea72b9de90';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [leaderboardProvider].
@ProviderFor(leaderboardProvider)
const leaderboardProviderProvider = LeaderboardProviderFamily();

/// See also [leaderboardProvider].
class LeaderboardProviderFamily
    extends Family<AsyncValue<List<LeaderboardEntry>>> {
  /// See also [leaderboardProvider].
  const LeaderboardProviderFamily();

  /// See also [leaderboardProvider].
  LeaderboardProviderProvider call({
    int limit = 10,
  }) {
    return LeaderboardProviderProvider(
      limit: limit,
    );
  }

  @override
  LeaderboardProviderProvider getProviderOverride(
    covariant LeaderboardProviderProvider provider,
  ) {
    return call(
      limit: provider.limit,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'leaderboardProviderProvider';
}

/// See also [leaderboardProvider].
class LeaderboardProviderProvider
    extends AutoDisposeFutureProvider<List<LeaderboardEntry>> {
  /// See also [leaderboardProvider].
  LeaderboardProviderProvider({
    int limit = 10,
  }) : this._internal(
          (ref) => leaderboardProvider(
            ref as LeaderboardProviderRef,
            limit: limit,
          ),
          from: leaderboardProviderProvider,
          name: r'leaderboardProviderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$leaderboardProviderHash,
          dependencies: LeaderboardProviderFamily._dependencies,
          allTransitiveDependencies:
              LeaderboardProviderFamily._allTransitiveDependencies,
          limit: limit,
        );

  LeaderboardProviderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.limit,
  }) : super.internal();

  final int limit;

  @override
  Override overrideWith(
    FutureOr<List<LeaderboardEntry>> Function(LeaderboardProviderRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LeaderboardProviderProvider._internal(
        (ref) => create(ref as LeaderboardProviderRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        limit: limit,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<LeaderboardEntry>> createElement() {
    return _LeaderboardProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LeaderboardProviderProvider && other.limit == limit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LeaderboardProviderRef
    on AutoDisposeFutureProviderRef<List<LeaderboardEntry>> {
  /// The parameter `limit` of this provider.
  int get limit;
}

class _LeaderboardProviderProviderElement
    extends AutoDisposeFutureProviderElement<List<LeaderboardEntry>>
    with LeaderboardProviderRef {
  _LeaderboardProviderProviderElement(super.provider);

  @override
  int get limit => (origin as LeaderboardProviderProvider).limit;
}

String _$gamificationControllerHash() =>
    r'43332363dad500719cbe8746bcc110ad41ed5293';

/// See also [GamificationController].
@ProviderFor(GamificationController)
final gamificationControllerProvider =
    AutoDisposeAsyncNotifierProvider<GamificationController, void>.internal(
  GamificationController.new,
  name: r'gamificationControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$gamificationControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GamificationController = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
