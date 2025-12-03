import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vetfield_flutter/core/error/failures.dart';
import 'package:vetfield_flutter/features/appointment/data/datasources/appointment_remote_datasource.dart';
import 'package:vetfield_flutter/features/appointment/data/repositories/appointment_repository_impl.dart';
import 'package:vetfield_flutter/features/appointment/domain/entities/appointment_entity.dart';

class MockAppointmentRemoteDataSource extends Mock
    implements AppointmentRemoteDataSource {}

void main() {
  late AppointmentRepositoryImpl repository;
  late MockAppointmentRemoteDataSource mockRemote;

  setUp(() {
    mockRemote = MockAppointmentRemoteDataSource();
    repository = AppointmentRepositoryImpl(remoteDataSource: mockRemote);
  });

  const tAppointmentId = 'apt_123';
  final tNewDateTime = DateTime(2025, 1, 10, 14, 30);

  group('updateAppointmentStatus', () {
    test('deve completar sem erro quando o data source retorna sucesso', () async {
      // arrange
      when(() => mockRemote.updateAppointmentStatus(tAppointmentId, AppointmentStatus.cancelled))
          .thenAnswer((_) async => Future.value());

      // act
      final result = await repository.updateAppointmentStatus(
        appointmentId: tAppointmentId,
        status: AppointmentStatus.cancelled,
      );

      // assert
      verify(() => mockRemote.updateAppointmentStatus(tAppointmentId, AppointmentStatus.cancelled));
      expect(result.isRight(), true);
    });

    test('deve retornar ServerFailure quando o data source lança exceção', () async {
      // arrange
      when(() => mockRemote.updateAppointmentStatus(tAppointmentId, AppointmentStatus.confirmed))
          .thenThrow(Exception('db error'));

      // act
      final result = await repository.updateAppointmentStatus(
        appointmentId: tAppointmentId,
        status: AppointmentStatus.confirmed,
      );

      // assert
      verify(() => mockRemote.updateAppointmentStatus(tAppointmentId, AppointmentStatus.confirmed));
      expect(result, isA<Left<Failure, void>>());
    });
  });

  group('updateAppointmentDateTime', () {
    test('deve completar sem erro quando o data source retorna sucesso', () async {
      // arrange
      when(() => mockRemote.updateAppointmentDateTime(tAppointmentId, tNewDateTime))
          .thenAnswer((_) async => Future.value());

      // act
      final result = await repository.updateAppointmentDateTime(
        appointmentId: tAppointmentId,
        newDateTime: tNewDateTime,
      );

      // assert
      verify(() => mockRemote.updateAppointmentDateTime(tAppointmentId, tNewDateTime));
      expect(result.isRight(), true);
    });

    test('deve retornar ServerFailure quando o data source lança exceção', () async {
      // arrange
      when(() => mockRemote.updateAppointmentDateTime(tAppointmentId, tNewDateTime))
          .thenThrow(Exception('db error'));

      // act
      final result = await repository.updateAppointmentDateTime(
        appointmentId: tAppointmentId,
        newDateTime: tNewDateTime,
      );

      // assert
      verify(() => mockRemote.updateAppointmentDateTime(tAppointmentId, tNewDateTime));
      expect(result, isA<Left<Failure, void>>());
    });
  });
}
