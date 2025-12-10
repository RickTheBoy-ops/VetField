// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gamification_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$gamificationRemoteDataSourceHash() =>
    r'6976945249beb698eaa72bfbc081e4cba3495180';

/// See also [gamificationRemoteDataSource].
@ProviderFor(gamificationRemoteDataSource)
final gamificationRemoteDataSourceProvider =
    Provider<GamificationRemoteDataSource>.internal(
  gamificationRemoteDataSource,
  name: r'gamificationRemoteDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$gamificationRemoteDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GamificationRemoteDataSourceRef
    = ProviderRef<GamificationRemoteDataSource>;
String _$gamificationLocalDataSourceHash() =>
    r'e8fd6244839b69a464d81051136858058228ea53';

/// See also [gamificationLocalDataSource].
@ProviderFor(gamificationLocalDataSource)
final gamificationLocalDataSourceProvider =
    Provider<GamificationLocalDataSource>.internal(
  gamificationLocalDataSource,
  name: r'gamificationLocalDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$gamificationLocalDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GamificationLocalDataSourceRef
    = ProviderRef<GamificationLocalDataSource>;
String _$gamificationRepositoryHash() =>
    r'03600244f641aabae85c6841cba89ac756bf2cfa';

/// See also [gamificationRepository].
@ProviderFor(gamificationRepository)
final gamificationRepositoryProvider =
    Provider<GamificationRepository>.internal(
  gamificationRepository,
  name: r'gamificationRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$gamificationRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GamificationRepositoryRef = ProviderRef<GamificationRepository>;
String _$userGamificationProfileHash() =>
    r'b800a936871a9506a08fe50afcefe33cbfd9a060';

/// See also [userGamificationProfile].
@ProviderFor(userGamificationProfile)
final userGamificationProfileProvider =
    FutureProvider<GamificationProfile>.internal(
  userGamificationProfile,
  name: r'userGamificationProfileProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userGamificationProfileHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserGamificationProfileRef = FutureProviderRef<GamificationProfile>;
String _$userTransactionHistoryHash() =>
    r'b8dffa013303b3375ee1ca269834a8af3e2ee6de';

/// See also [userTransactionHistory].
@ProviderFor(userTransactionHistory)
final userTransactionHistoryProvider =
    FutureProvider<List<PointTransaction>>.internal(
  userTransactionHistory,
  name: r'userTransactionHistoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userTransactionHistoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserTransactionHistoryRef = FutureProviderRef<List<PointTransaction>>;
String _$leaderboardProviderHash() =>
    r'16a171fc37a00556e87dfa040fdbe56637ccac36';

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
    extends FutureProvider<List<LeaderboardEntry>> {
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
  FutureProviderElement<List<LeaderboardEntry>> createElement() {
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

mixin LeaderboardProviderRef on FutureProviderRef<List<LeaderboardEntry>> {
  /// The parameter `limit` of this provider.
  int get limit;
}

class _LeaderboardProviderProviderElement
    extends FutureProviderElement<List<LeaderboardEntry>>
    with LeaderboardProviderRef {
  _LeaderboardProviderProviderElement(super.provider);

  @override
  int get limit => (origin as LeaderboardProviderProvider).limit;
}

String _$gamificationControllerHash() =>
    r'ff14f6379ae062a5010c8240f00afce2dcdec108';

/// See also [GamificationController].
@ProviderFor(GamificationController)
final gamificationControllerProvider =
    AsyncNotifierProvider<GamificationController, void>.internal(
  GamificationController.new,
  name: r'gamificationControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$gamificationControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GamificationController = AsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
