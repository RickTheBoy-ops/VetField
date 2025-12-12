import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/supabase_provider.dart';
import '../../data/datasources/auth_remote_datasource.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/register_usecase.dart';
import '../../domain/usecases/login_by_cpf_usecase.dart';
import '../../domain/usecases/login_by_crmv_usecase.dart';
import '../../domain/usecases/reset_password_usecase.dart';
import '../../domain/usecases/update_profile_usecase.dart';

import '../../data/datasources/auth_local_datasource.dart';

part 'auth_provider.g.dart';

// Data Sources
@Riverpod(keepAlive: true)
AuthRemoteDataSource authRemoteDataSource(Ref ref) {
  final supabaseClient = ref.watch(supabaseClientProvider);
  return AuthRemoteDataSourceImpl(supabaseClient);
}

@Riverpod(keepAlive: true)
AuthLocalDataSource authLocalDataSource(Ref ref) {
  return AuthLocalDataSourceImpl();
}

// Repositories
@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  final remoteDataSource = ref.watch(authRemoteDataSourceProvider);
  final localDataSource = ref.watch(authLocalDataSourceProvider);
  return AuthRepositoryImpl(
    remoteDataSource: remoteDataSource,
    localDataSource: localDataSource,
  );
}

// Use Cases
@Riverpod(keepAlive: true)
LoginUseCase loginUseCase(Ref ref) {
  final repository = ref.watch(authRepositoryProvider);
  return LoginUseCase(repository);
}

@Riverpod(keepAlive: true)
RegisterUseCase registerUseCase(Ref ref) {
  final repository = ref.watch(authRepositoryProvider);
  return RegisterUseCase(repository);
}

@Riverpod(keepAlive: true)
LoginByCpfUseCase loginByCpfUseCase(Ref ref) {
  final repository = ref.watch(authRepositoryProvider);
  return LoginByCpfUseCase(repository);
}

@Riverpod(keepAlive: true)
LoginByCrmvUseCase loginByCrmvUseCase(Ref ref) {
  final repository = ref.watch(authRepositoryProvider);
  return LoginByCrmvUseCase(repository);
}

@Riverpod(keepAlive: true)
ResetPasswordUseCase resetPasswordUseCase(Ref ref) {
  final repository = ref.watch(authRepositoryProvider);
  return ResetPasswordUseCase(repository);
}

@Riverpod(keepAlive: true)
UpdateProfileUseCase updateProfileUseCase(Ref ref) {
  final repository = ref.watch(authRepositoryProvider);
  return UpdateProfileUseCase(repository);
}

// Auth State
@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  @override
  FutureOr<UserEntity?> build() {
    return null;
  }

  Future<void> login(String email, String password) async {
    print('AuthController: Login started for $email');
    state = const AsyncValue.loading();

    try {
      final useCase = ref.read(loginUseCaseProvider);
      final result = await useCase(
        LoginParams(email: email, password: password),
      );

      result.fold(
        (failure) {
          print('AuthController: Login failed - ${failure.message}');
          state = AsyncValue.error(failure.message, StackTrace.current);
        },
        (user) {
          print('AuthController: Login success - User: ${user.id}');
          state = AsyncValue.data(user);
        },
      );
    } catch (e, st) {
      print('AuthController: Unexpected error - $e');
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> loginWithCpf(String cpf, String password) async {
    state = const AsyncValue.loading();
    final useCase = ref.read(loginByCpfUseCaseProvider);
    final result = await useCase(
      LoginByCpfParams(cpf: cpf, password: password),
    );
    result.fold(
      (failure) =>
          state = AsyncValue.error(failure.message, StackTrace.current),
      (user) => state = AsyncValue.data(user),
    );
  }

  Future<void> loginWithCrmv(String crmv, String password) async {
    state = const AsyncValue.loading();
    final useCase = ref.read(loginByCrmvUseCaseProvider);
    final result = await useCase(
      LoginByCrmvParams(crmv: crmv, password: password),
    );
    result.fold(
      (failure) =>
          state = AsyncValue.error(failure.message, StackTrace.current),
      (user) => state = AsyncValue.data(user),
    );
  }

  Future<void> register({
    required String email,
    required String password,
    required String name,
    required UserType type,
    String? crmv,
    String? cpf,
  }) async {
    state = const AsyncValue.loading();

    final useCase = ref.read(registerUseCaseProvider);
    final result = await useCase(
      RegisterParams(
        email: email,
        password: password,
        name: name,
        type: type,
        crmv: crmv,
        cpf: cpf,
      ),
    );

    result.fold(
      (failure) =>
          state = AsyncValue.error(failure.message, StackTrace.current),
      (user) => state = AsyncValue.data(user),
    );
  }

  Future<void> logout() async {
    final client = ref.read(supabaseClientProvider);
    await client.auth.signOut();
    state = const AsyncValue.data(null);
  }

  Future<void> sendPasswordReset(String email) async {
    final useCase = ref.read(resetPasswordUseCaseProvider);
    final result = await useCase(ResetPasswordParams(email: email));
    result.fold(
      (failure) =>
          state = AsyncValue.error(failure.message, StackTrace.current),
      (_) {},
    );
  }

  Future<void> updateProfile({
    String? name,
    String? avatarUrl,
    String? crmv,
    String? cpf,
  }) async {
    final useCase = ref.read(updateProfileUseCaseProvider);
    final result = await useCase(
      UpdateProfileParams(
        name: name,
        avatarUrl: avatarUrl,
        crmv: crmv,
        cpf: cpf,
      ),
    );
    result.fold(
      (failure) =>
          state = AsyncValue.error(failure.message, StackTrace.current),
      (user) => state = AsyncValue.data(user),
    );
  }
}

// Current User Provider (for Auth Guards)
@Riverpod(keepAlive: true)
Stream<UserEntity?> currentUser(Ref ref) async* {
  final supabase = ref.watch(supabaseClientProvider);
  print('CurrentUserProvider: Initializing stream');

  // Helper for mapping
  UserEntity? mapSession(Session? session) {
    if (session == null) return null;
    return UserEntity(
      id: session.user.id,
      email: session.user.email ?? '',
      name: session.user.userMetadata?['name'] ?? '',
      type: session.user.userMetadata?['type'] == 'vet'
          ? UserType.vet
          : UserType.owner,
    );
  }

  // Yield current state immediately
  final currentSession = supabase.auth.currentSession;
  print(
    'CurrentUserProvider: Initial session check: ${currentSession?.user.email}',
  );
  yield mapSession(currentSession);

  // Yield future states
  await for (final event in supabase.auth.onAuthStateChange) {
    print(
      'CurrentUserProvider: Auth Event: ${event.event} User: ${event.session?.user.email}',
    );
    yield mapSession(event.session);
  }
}
