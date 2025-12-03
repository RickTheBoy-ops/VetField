import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class LoginByCpfUseCase implements UseCase<UserEntity, LoginByCpfParams> {
  final AuthRepository repository;

  LoginByCpfUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(LoginByCpfParams params) {
    return repository.loginByCpf(params.cpf, params.password);
  }
}

class LoginByCpfParams extends Equatable {
  final String cpf;
  final String password;

  const LoginByCpfParams({required this.cpf, required this.password});

  @override
  List<Object?> get props => [cpf, password];
}
