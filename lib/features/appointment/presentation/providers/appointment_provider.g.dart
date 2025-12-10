// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appointmentRemoteDataSourceHash() =>
    r'ce8bff5123b63e1bf4b7c1bc63b85bedb332c77e';

/// See also [appointmentRemoteDataSource].
@ProviderFor(appointmentRemoteDataSource)
final appointmentRemoteDataSourceProvider =
    Provider<AppointmentRemoteDataSource>.internal(
  appointmentRemoteDataSource,
  name: r'appointmentRemoteDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appointmentRemoteDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppointmentRemoteDataSourceRef
    = ProviderRef<AppointmentRemoteDataSource>;
String _$appointmentLocalDataSourceHash() =>
    r'f936cc8cebee0c6fa6d5b9a7cb20a43b2027386c';

/// See also [appointmentLocalDataSource].
@ProviderFor(appointmentLocalDataSource)
final appointmentLocalDataSourceProvider =
    Provider<AppointmentLocalDataSource>.internal(
  appointmentLocalDataSource,
  name: r'appointmentLocalDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appointmentLocalDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppointmentLocalDataSourceRef = ProviderRef<AppointmentLocalDataSource>;
String _$appointmentRepositoryHash() =>
    r'529b6f077ab13674b432973b3557eca769ac35dc';

/// See also [appointmentRepository].
@ProviderFor(appointmentRepository)
final appointmentRepositoryProvider = Provider<AppointmentRepository>.internal(
  appointmentRepository,
  name: r'appointmentRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appointmentRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppointmentRepositoryRef = ProviderRef<AppointmentRepository>;
String _$createAppointmentUseCaseHash() =>
    r'5926c210a289ef026c3aeb7be62c10f18bea93e1';

/// See also [createAppointmentUseCase].
@ProviderFor(createAppointmentUseCase)
final createAppointmentUseCaseProvider =
    Provider<CreateAppointmentUseCase>.internal(
  createAppointmentUseCase,
  name: r'createAppointmentUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$createAppointmentUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CreateAppointmentUseCaseRef = ProviderRef<CreateAppointmentUseCase>;
String _$updateAppointmentStatusUseCaseHash() =>
    r'5fa7b66f2b05b532234d913fa5d2ac2068ba9fcd';

/// See also [updateAppointmentStatusUseCase].
@ProviderFor(updateAppointmentStatusUseCase)
final updateAppointmentStatusUseCaseProvider =
    Provider<UpdateAppointmentStatusUseCase>.internal(
  updateAppointmentStatusUseCase,
  name: r'updateAppointmentStatusUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$updateAppointmentStatusUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UpdateAppointmentStatusUseCaseRef
    = ProviderRef<UpdateAppointmentStatusUseCase>;
String _$vetAppointmentsHash() => r'683b5fd0cb41d4d9b552bdfaab3f52b56e144db7';

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

/// See also [vetAppointments].
@ProviderFor(vetAppointments)
const vetAppointmentsProvider = VetAppointmentsFamily();

/// See also [vetAppointments].
class VetAppointmentsFamily
    extends Family<AsyncValue<List<AppointmentEntity>>> {
  /// See also [vetAppointments].
  const VetAppointmentsFamily();

  /// See also [vetAppointments].
  VetAppointmentsProvider call(
    String vetId,
  ) {
    return VetAppointmentsProvider(
      vetId,
    );
  }

  @override
  VetAppointmentsProvider getProviderOverride(
    covariant VetAppointmentsProvider provider,
  ) {
    return call(
      provider.vetId,
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
  String? get name => r'vetAppointmentsProvider';
}

/// See also [vetAppointments].
class VetAppointmentsProvider extends FutureProvider<List<AppointmentEntity>> {
  /// See also [vetAppointments].
  VetAppointmentsProvider(
    String vetId,
  ) : this._internal(
          (ref) => vetAppointments(
            ref as VetAppointmentsRef,
            vetId,
          ),
          from: vetAppointmentsProvider,
          name: r'vetAppointmentsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$vetAppointmentsHash,
          dependencies: VetAppointmentsFamily._dependencies,
          allTransitiveDependencies:
              VetAppointmentsFamily._allTransitiveDependencies,
          vetId: vetId,
        );

  VetAppointmentsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.vetId,
  }) : super.internal();

  final String vetId;

  @override
  Override overrideWith(
    FutureOr<List<AppointmentEntity>> Function(VetAppointmentsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: VetAppointmentsProvider._internal(
        (ref) => create(ref as VetAppointmentsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        vetId: vetId,
      ),
    );
  }

  @override
  FutureProviderElement<List<AppointmentEntity>> createElement() {
    return _VetAppointmentsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VetAppointmentsProvider && other.vetId == vetId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, vetId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin VetAppointmentsRef on FutureProviderRef<List<AppointmentEntity>> {
  /// The parameter `vetId` of this provider.
  String get vetId;
}

class _VetAppointmentsProviderElement
    extends FutureProviderElement<List<AppointmentEntity>>
    with VetAppointmentsRef {
  _VetAppointmentsProviderElement(super.provider);

  @override
  String get vetId => (origin as VetAppointmentsProvider).vetId;
}

String _$ownerAppointmentsHash() => r'75a787557acb654a62f287db9ce906ad2d51b749';

/// See also [ownerAppointments].
@ProviderFor(ownerAppointments)
const ownerAppointmentsProvider = OwnerAppointmentsFamily();

/// See also [ownerAppointments].
class OwnerAppointmentsFamily
    extends Family<AsyncValue<List<AppointmentEntity>>> {
  /// See also [ownerAppointments].
  const OwnerAppointmentsFamily();

  /// See also [ownerAppointments].
  OwnerAppointmentsProvider call(
    String ownerId,
  ) {
    return OwnerAppointmentsProvider(
      ownerId,
    );
  }

  @override
  OwnerAppointmentsProvider getProviderOverride(
    covariant OwnerAppointmentsProvider provider,
  ) {
    return call(
      provider.ownerId,
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
  String? get name => r'ownerAppointmentsProvider';
}

/// See also [ownerAppointments].
class OwnerAppointmentsProvider
    extends FutureProvider<List<AppointmentEntity>> {
  /// See also [ownerAppointments].
  OwnerAppointmentsProvider(
    String ownerId,
  ) : this._internal(
          (ref) => ownerAppointments(
            ref as OwnerAppointmentsRef,
            ownerId,
          ),
          from: ownerAppointmentsProvider,
          name: r'ownerAppointmentsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$ownerAppointmentsHash,
          dependencies: OwnerAppointmentsFamily._dependencies,
          allTransitiveDependencies:
              OwnerAppointmentsFamily._allTransitiveDependencies,
          ownerId: ownerId,
        );

  OwnerAppointmentsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.ownerId,
  }) : super.internal();

  final String ownerId;

  @override
  Override overrideWith(
    FutureOr<List<AppointmentEntity>> Function(OwnerAppointmentsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: OwnerAppointmentsProvider._internal(
        (ref) => create(ref as OwnerAppointmentsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        ownerId: ownerId,
      ),
    );
  }

  @override
  FutureProviderElement<List<AppointmentEntity>> createElement() {
    return _OwnerAppointmentsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OwnerAppointmentsProvider && other.ownerId == ownerId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, ownerId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin OwnerAppointmentsRef on FutureProviderRef<List<AppointmentEntity>> {
  /// The parameter `ownerId` of this provider.
  String get ownerId;
}

class _OwnerAppointmentsProviderElement
    extends FutureProviderElement<List<AppointmentEntity>>
    with OwnerAppointmentsRef {
  _OwnerAppointmentsProviderElement(super.provider);

  @override
  String get ownerId => (origin as OwnerAppointmentsProvider).ownerId;
}

String _$appointmentControllerHash() =>
    r'535e820184c3fb06303a7cb5073e450096a0a76f';

/// See also [AppointmentController].
@ProviderFor(AppointmentController)
final appointmentControllerProvider =
    AsyncNotifierProvider<AppointmentController, void>.internal(
  AppointmentController.new,
  name: r'appointmentControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appointmentControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AppointmentController = AsyncNotifier<void>;
String _$ownerAppointmentsRealtimeHash() =>
    r'077d129dfdf4e3144ee4812c90e5176a42b97424';

/// See also [OwnerAppointmentsRealtime].
@ProviderFor(OwnerAppointmentsRealtime)
final ownerAppointmentsRealtimeProvider =
    AsyncNotifierProvider<OwnerAppointmentsRealtime, void>.internal(
  OwnerAppointmentsRealtime.new,
  name: r'ownerAppointmentsRealtimeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$ownerAppointmentsRealtimeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$OwnerAppointmentsRealtime = AsyncNotifier<void>;
String _$vetAppointmentsRealtimeHash() =>
    r'a9240394dbcca55001ee46f70c01023dd2f57dde';

/// See also [VetAppointmentsRealtime].
@ProviderFor(VetAppointmentsRealtime)
final vetAppointmentsRealtimeProvider =
    AsyncNotifierProvider<VetAppointmentsRealtime, void>.internal(
  VetAppointmentsRealtime.new,
  name: r'vetAppointmentsRealtimeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$vetAppointmentsRealtimeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$VetAppointmentsRealtime = AsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
