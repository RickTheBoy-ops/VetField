import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vetfield_flutter/core/error/failures.dart';
import 'package:vetfield_flutter/features/auth/domain/entities/user_entity.dart';
import 'package:vetfield_flutter/features/auth/domain/repositories/auth_repository.dart';
import 'package:vetfield_flutter/features/auth/domain/usecases/login_usecase.dart';

// Mock Repository
class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late LoginUseCase useCase;
  late MockAuthRepository mockRepository;

  setUp(() {
    mockRepository = MockAuthRepository();
    useCase = LoginUseCase(mockRepository);
  });

  const testEmail = 'test@example.com';
  const testPassword = 'password123';
  const testUser = UserEntity(
    id: '1',
    email: testEmail,
    name: 'Test User',
    type: UserType.owner,
  );

  group('LoginUseCase', () {
    test('should return User on successful login', () async {
      // Arrange
      when(() => mockRepository.login(
            email: testEmail,
            password: testPassword,
          )).thenAnswer((_) async => const Right(testUser));

      // Act
      final result = await useCase(
        LoginParams(email: testEmail, password: testPassword),
      );

      // Assert
      expect(result, const Right(testUser));
      verify(() => mockRepository.login(
            email: testEmail,
            password: testPassword,
          )).called(1);
    });

    test('should return ServerFailure when login fails', () async {
      // Arrange
      const failure = ServerFailure('Invalid credentials');
      when(() => mockRepository.login(
            email: testEmail,
            password: 'wrongpassword',
          )).thenAnswer((_) async => const Left(failure));

      // Act
      final result = await useCase(
        LoginParams(email: testEmail, password: 'wrongpassword'),
      );

      // Assert
      expect(result, const Left(failure));
      verify(() => mockRepository.login(
            email: testEmail,
            password: 'wrongpassword',
          )).called(1);
    });

    test('should return Failure when repository throws exception', () async {
      // Arrange
      when(() => mockRepository.login(
            email: testEmail,
            password: testPassword,
          )).thenThrow(Exception('Network error'));

      // Act & Assert
      expect(
        () => useCase(LoginParams(email: testEmail, password: testPassword)),
        throwsA(isA<Exception>()),
      );
    });
  });
}
