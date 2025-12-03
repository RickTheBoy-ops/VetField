// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appointmentRemoteDataSourceHash() =>
    r'51769836cf5d7af07df56c50c7ae560f4f667501';

/// See also [appointmentRemoteDataSource].
@ProviderFor(appointmentRemoteDataSource)
final appointmentRemoteDataSourceProvider =
    AutoDisposeProvider<AppointmentRemoteDataSource>.internal(
      appointmentRemoteDataSource,
      name: r'appointmentRemoteDataSourceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$appointmentRemoteDataSourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AppointmentRemoteDataSourceRef =
    AutoDisposeProviderRef<AppointmentRemoteDataSource>;
String _$appointmentRepositoryHash() =>
    r'6021ff3bf52d5efce8ead52e53158766924d6787';

/// See also [appointmentRepository].
@ProviderFor(appointmentRepository)
final appointmentRepositoryProvider =
    AutoDisposeProvider<AppointmentRepository>.internal(
      appointmentRepository,
      name: r'appointmentRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$appointmentRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AppointmentRepositoryRef =
    AutoDisposeProviderRef<AppointmentRepository>;
String _$createAppointmentUseCaseHash() =>
    r'2b3f65025f71535dc766973483b155f8de4798e7';

/// See also [createAppointmentUseCase].
@ProviderFor(createAppointmentUseCase)
final createAppointmentUseCaseProvider =
    AutoDisposeProvider<CreateAppointmentUseCase>.internal(
      createAppointmentUseCase,
      name: r'createAppointmentUseCaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$createAppointmentUseCaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CreateAppointmentUseCaseRef =
    AutoDisposeProviderRef<CreateAppointmentUseCase>;
String _$updateAppointmentStatusUseCaseHash() =>
    r'88ee21f548e141c6204e813dc6513cb2de2be546';

/// See also [updateAppointmentStatusUseCase].
@ProviderFor(updateAppointmentStatusUseCase)
final updateAppointmentStatusUseCaseProvider =
    AutoDisposeProvider<UpdateAppointmentStatusUseCase>.internal(
      updateAppointmentStatusUseCase,
      name: r'updateAppointmentStatusUseCaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$updateAppointmentStatusUseCaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UpdateAppointmentStatusUseCaseRef =
    AutoDisposeProviderRef<UpdateAppointmentStatusUseCase>;
String _$vetAppointmentsHash() => r'8a652d44cd9aba086c2767cdce1134874415bdee';

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
  VetAppointmentsProvider call(String vetId) {
    return VetAppointmentsProvider(vetId);
  }

  @override
  VetAppointmentsProvider getProviderOverride(
    covariant VetAppointmentsProvider provider,
  ) {
    return call(provider.vetId);
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
class VetAppointmentsProvider
    extends AutoDisposeFutureProvider<List<AppointmentEntity>> {
  /// See also [vetAppointments].
  VetAppointmentsProvider(String vetId)
    : this._internal(
        (ref) => vetAppointments(ref as VetAppointmentsRef, vetId),
        from: vetAppointmentsProvider,
        name: r'vetAppointmentsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
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
  AutoDisposeFutureProviderElement<List<AppointmentEntity>> createElement() {
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin VetAppointmentsRef
    on AutoDisposeFutureProviderRef<List<AppointmentEntity>> {
  /// The parameter `vetId` of this provider.
  String get vetId;
}

class _VetAppointmentsProviderElement
    extends AutoDisposeFutureProviderElement<List<AppointmentEntity>>
    with VetAppointmentsRef {
  _VetAppointmentsProviderElement(super.provider);

  @override
  String get vetId => (origin as VetAppointmentsProvider).vetId;
}

String _$ownerAppointmentsHash() => r'37825a4c9264f18427afe95194b036d4aa88d13c';

/// See also [ownerAppointments].
@ProviderFor(ownerAppointments)
const ownerAppointmentsProvider = OwnerAppointmentsFamily();

/// See also [ownerAppointments].
class OwnerAppointmentsFamily
    extends Family<AsyncValue<List<AppointmentEntity>>> {
  /// See also [ownerAppointments].
  const OwnerAppointmentsFamily();

  /// See also [ownerAppointments].
  OwnerAppointmentsProvider call(String ownerId) {
    return OwnerAppointmentsProvider(ownerId);
  }

  @override
  OwnerAppointmentsProvider getProviderOverride(
    covariant OwnerAppointmentsProvider provider,
  ) {
    return call(provider.ownerId);
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
    extends AutoDisposeFutureProvider<List<AppointmentEntity>> {
  /// See also [ownerAppointments].
  OwnerAppointmentsProvider(String ownerId)
    : this._internal(
        (ref) => ownerAppointments(ref as OwnerAppointmentsRef, ownerId),
        from: ownerAppointmentsProvider,
        name: r'ownerAppointmentsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
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
  AutoDisposeFutureProviderElement<List<AppointmentEntity>> createElement() {
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin OwnerAppointmentsRef
    on AutoDisposeFutureProviderRef<List<AppointmentEntity>> {
  /// The parameter `ownerId` of this provider.
  String get ownerId;
}

class _OwnerAppointmentsProviderElement
    extends AutoDisposeFutureProviderElement<List<AppointmentEntity>>
    with OwnerAppointmentsRef {
  _OwnerAppointmentsProviderElement(super.provider);

  @override
  String get ownerId => (origin as OwnerAppointmentsProvider).ownerId;
}

String _$appointmentControllerHash() =>
    r'5da06bc66450bacb8a012fcd1d475cd78d2cc3a6';

/// See also [AppointmentController].
@ProviderFor(AppointmentController)
final appointmentControllerProvider =
    AutoDisposeAsyncNotifierProvider<AppointmentController, void>.internal(
      AppointmentController.new,
      name: r'appointmentControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$appointmentControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AppointmentController = AutoDisposeAsyncNotifier<void>;
String _$ownerAppointmentsRealtimeHash() =>
    r'3cdbc2b2b8b28fcdd2481063d5af6d92b2d985c3';

/// See also [OwnerAppointmentsRealtime].
@ProviderFor(OwnerAppointmentsRealtime)
final ownerAppointmentsRealtimeProvider =
    AutoDisposeAsyncNotifierProvider<OwnerAppointmentsRealtime, void>.internal(
      OwnerAppointmentsRealtime.new,
      name: r'ownerAppointmentsRealtimeProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$ownerAppointmentsRealtimeHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$OwnerAppointmentsRealtime = AutoDisposeAsyncNotifier<void>;
String _$vetAppointmentsRealtimeHash() =>
    r'b6200ab2d0d86488454be64fbf622ab722f2c026';

/// See also [VetAppointmentsRealtime].
@ProviderFor(VetAppointmentsRealtime)
final vetAppointmentsRealtimeProvider =
    AutoDisposeAsyncNotifierProvider<VetAppointmentsRealtime, void>.internal(
      VetAppointmentsRealtime.new,
      name: r'vetAppointmentsRealtimeProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$vetAppointmentsRealtimeHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$VetAppointmentsRealtime = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
