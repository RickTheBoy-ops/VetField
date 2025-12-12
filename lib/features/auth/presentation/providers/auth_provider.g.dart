// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authRemoteDataSourceHash() =>
    r'b0f3303332dd6fcf56f8e588ece05bcfc61ea9bc';

/// See also [authRemoteDataSource].
@ProviderFor(authRemoteDataSource)
final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>.internal(
  authRemoteDataSource,
  name: r'authRemoteDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authRemoteDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthRemoteDataSourceRef = ProviderRef<AuthRemoteDataSource>;
String _$authLocalDataSourceHash() =>
    r'bd0fe1445f6153dd1ea7706a4327608d35bd807f';

/// See also [authLocalDataSource].
@ProviderFor(authLocalDataSource)
final authLocalDataSourceProvider = Provider<AuthLocalDataSource>.internal(
  authLocalDataSource,
  name: r'authLocalDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authLocalDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthLocalDataSourceRef = ProviderRef<AuthLocalDataSource>;
String _$authRepositoryHash() => r'f8cb09c69d009ade063d4226d97d9b3526c6cc5b';

/// See also [authRepository].
@ProviderFor(authRepository)
final authRepositoryProvider = Provider<AuthRepository>.internal(
  authRepository,
  name: r'authRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthRepositoryRef = ProviderRef<AuthRepository>;
String _$loginUseCaseHash() => r'c1d38f2bd23500953dbb22d11f783dc5875793bf';

/// See also [loginUseCase].
@ProviderFor(loginUseCase)
final loginUseCaseProvider = Provider<LoginUseCase>.internal(
  loginUseCase,
  name: r'loginUseCaseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$loginUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LoginUseCaseRef = ProviderRef<LoginUseCase>;
String _$registerUseCaseHash() => r'df1aef0660cba98d23715c54ba2ce26fdaec063c';

/// See also [registerUseCase].
@ProviderFor(registerUseCase)
final registerUseCaseProvider = Provider<RegisterUseCase>.internal(
  registerUseCase,
  name: r'registerUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$registerUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RegisterUseCaseRef = ProviderRef<RegisterUseCase>;
String _$loginByCpfUseCaseHash() => r'39b0919c51c477f2c2f518a2df081b54d297a7fd';

/// See also [loginByCpfUseCase].
@ProviderFor(loginByCpfUseCase)
final loginByCpfUseCaseProvider = Provider<LoginByCpfUseCase>.internal(
  loginByCpfUseCase,
  name: r'loginByCpfUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$loginByCpfUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LoginByCpfUseCaseRef = ProviderRef<LoginByCpfUseCase>;
String _$loginByCrmvUseCaseHash() =>
    r'4a9a4c40225eb3f6c07ee4d8cb5c3b810e3cc3eb';

/// See also [loginByCrmvUseCase].
@ProviderFor(loginByCrmvUseCase)
final loginByCrmvUseCaseProvider = Provider<LoginByCrmvUseCase>.internal(
  loginByCrmvUseCase,
  name: r'loginByCrmvUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$loginByCrmvUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LoginByCrmvUseCaseRef = ProviderRef<LoginByCrmvUseCase>;
String _$resetPasswordUseCaseHash() =>
    r'3f39d55ddf54c4354b14c72b7a936e3ebd5eb54e';

/// See also [resetPasswordUseCase].
@ProviderFor(resetPasswordUseCase)
final resetPasswordUseCaseProvider = Provider<ResetPasswordUseCase>.internal(
  resetPasswordUseCase,
  name: r'resetPasswordUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$resetPasswordUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ResetPasswordUseCaseRef = ProviderRef<ResetPasswordUseCase>;
String _$updateProfileUseCaseHash() =>
    r'55ec5856818f210ff60fd8c022419c80c61593c0';

/// See also [updateProfileUseCase].
@ProviderFor(updateProfileUseCase)
final updateProfileUseCaseProvider = Provider<UpdateProfileUseCase>.internal(
  updateProfileUseCase,
  name: r'updateProfileUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$updateProfileUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UpdateProfileUseCaseRef = ProviderRef<UpdateProfileUseCase>;
String _$currentUserHash() => r'4a3673bdf3c237d10559856af52831ca56ceceec';

/// See also [currentUser].
@ProviderFor(currentUser)
final currentUserProvider = StreamProvider<UserEntity?>.internal(
  currentUser,
  name: r'currentUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentUserRef = StreamProviderRef<UserEntity?>;
String _$authControllerHash() => r'1b13d39ebfd57ebefd9a50a8c8bcba7bfdf354f3';

/// See also [AuthController].
@ProviderFor(AuthController)
final authControllerProvider =
    AsyncNotifierProvider<AuthController, UserEntity?>.internal(
  AuthController.new,
  name: r'authControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AuthController = AsyncNotifier<UserEntity?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
