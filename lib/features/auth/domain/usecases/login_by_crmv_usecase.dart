import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class LoginByCrmvUseCase implements UseCase<UserEntity, LoginByCrmvParams> {
  final AuthRepository repository;

  LoginByCrmvUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(LoginByCrmvParams params) {
    return repository.loginByCrmv(params.crmv, params.password);
  }
}

class LoginByCrmvParams extends Equatable {
  final String crmv;
  final String password;

  const LoginByCrmvParams({required this.crmv, required this.password});

  @override
  List<Object?> get props => [crmv, password];
}
