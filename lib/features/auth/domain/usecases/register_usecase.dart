import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class RegisterUseCase implements UseCase<UserEntity, RegisterParams> {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(RegisterParams params) {
    return repository.register(
      email: params.email,
      password: params.password,
      name: params.name,
      type: params.type,
      crmv: params.crmv,
      cpf: params.cpf,
    );
  }
}

class RegisterParams extends Equatable {
  final String email;
  final String password;
  final String name;
  final UserType type;
  final String? crmv;
  final String? cpf;

  const RegisterParams({
    required this.email,
    required this.password,
    required this.name,
    required this.type,
    this.crmv,
    this.cpf,
  });

  @override
  List<Object?> get props => [email, password, name, type, crmv, cpf];
}
