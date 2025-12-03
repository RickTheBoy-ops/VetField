import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> login(String email, String password);
  Future<Either<Failure, UserEntity>> loginByCpf(String cpf, String password);
  Future<Either<Failure, UserEntity>> loginByCrmv(String crmv, String password);
  Future<Either<Failure, UserEntity>> register({
    required String email,
    required String password,
    required String name,
    required UserType type,
    String? crmv,
    String? cpf,
  });
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, UserEntity?>> getCurrentUser();
  Future<Either<Failure, void>> resetPassword(String email);
  Future<Either<Failure, UserEntity>> updateProfile({
    String? name,
    String? avatarUrl,
    String? crmv,
    String? cpf,
  });
}
