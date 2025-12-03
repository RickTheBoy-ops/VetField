import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:vetfield_flutter/features/auth/domain/entities/user_entity.dart';
import 'package:vetfield_flutter/features/auth/domain/repositories/auth_repository.dart';
import 'package:vetfield_flutter/features/auth/domain/usecases/login_by_cpf_usecase.dart';
import 'package:vetfield_flutter/core/error/failures.dart';

class _MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late _MockAuthRepository repository;
  late LoginByCpfUseCase useCase;

  setUp(() {
    repository = _MockAuthRepository();
    useCase = LoginByCpfUseCase(repository);
  });

  test('deve retornar UserEntity quando login CPF for bem-sucedido', () async {
    const params = LoginByCpfParams(cpf: '12345678901', password: 'secret');
    const user = UserEntity(id: '1', email: 'a@b.com', name: 'Ana', type: UserType.owner);

    when(() => repository.loginByCpf(params.cpf, params.password))
        .thenAnswer((_) async => const Right(user));

    final result = await useCase(params);
    expect(result.isRight(), true);
    expect(result, const Right(user));
  });

  test('deve retornar Failure quando login CPF falhar', () async {
    const params = LoginByCpfParams(cpf: '123', password: 'secret');
    when(() => repository.loginByCpf(params.cpf, params.password))
        .thenAnswer((_) async => Left(AuthFailure('Erro')));

    final result = await useCase(params);
    expect(result.isLeft(), true);
  });
}
