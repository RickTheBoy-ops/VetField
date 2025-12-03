import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class UpdateProfileUseCase implements UseCase<UserEntity, UpdateProfileParams> {
  final AuthRepository repository;

  UpdateProfileUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(UpdateProfileParams params) {
    return repository.updateProfile(
      name: params.name,
      avatarUrl: params.avatarUrl,
      crmv: params.crmv,
      cpf: params.cpf,
    );
  }
}

class UpdateProfileParams {
  final String? name;
  final String? avatarUrl;
  final String? crmv;
  final String? cpf;

  const UpdateProfileParams({
    this.name,
    this.avatarUrl,
    this.crmv,
    this.cpf,
  });
}
