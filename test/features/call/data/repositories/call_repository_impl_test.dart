import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vetfield_flutter/core/error/failures.dart';
import 'package:vetfield_flutter/features/call/data/datasources/call_remote_datasource.dart';
import 'package:vetfield_flutter/features/call/data/repositories/call_repository_impl.dart';

class MockCallRemoteDataSource extends Mock implements CallRemoteDataSource {}

void main() {
  late CallRepositoryImpl repository;
  late MockCallRemoteDataSource mockRemote;

  setUp(() {
    mockRemote = MockCallRemoteDataSource();
    repository = CallRepositoryImpl(mockRemote);
  });

  const tAppointmentId = 'apt_123';
  const tOwnerId = 'owner_1';
  const tVetId = 'vet_1';
  const tUrl = 'https://meet.jit.si/test-room';

  group('startOrJoinCall', () {
    test('deve retornar URL quando data source é bem-sucedido', () async {
      when(() => mockRemote.startOrJoinCall(
            appointmentId: any(named: 'appointmentId'),
            ownerId: any(named: 'ownerId'),
            vetId: any(named: 'vetId'),
          )).thenAnswer((_) async => tUrl);

      final result = await repository.startOrJoinCall(
        appointmentId: tAppointmentId,
        ownerId: tOwnerId,
        vetId: tVetId,
      );

      verify(() => mockRemote.startOrJoinCall(
            appointmentId: tAppointmentId,
            ownerId: tOwnerId,
            vetId: tVetId,
          ));
      expect(result.isRight(), true);
      result.fold((l) => fail('Should be Right'), (r) => expect(r, tUrl));
    });

    test('deve retornar ServerFailure quando data source lança exceção', () async {
      when(() => mockRemote.startOrJoinCall(
            appointmentId: any(named: 'appointmentId'),
            ownerId: any(named: 'ownerId'),
            vetId: any(named: 'vetId'),
          )).thenThrow(Exception('network'));

      final result = await repository.startOrJoinCall(
        appointmentId: tAppointmentId,
        ownerId: tOwnerId,
        vetId: tVetId,
      );

      expect(result, isA<Left<Failure, String>>());
    });
  });

  group('completeCall', () {
    test('deve completar sem erro quando data source é bem-sucedido', () async {
      when(() => mockRemote.completeCall(appointmentId: any(named: 'appointmentId')))
          .thenAnswer((_) async => Future.value());

      final result = await repository.completeCall(appointmentId: tAppointmentId);

      verify(() => mockRemote.completeCall(appointmentId: tAppointmentId));
      expect(result.isRight(), true);
    });

    test('deve retornar ServerFailure quando data source lança exceção', () async {
      when(() => mockRemote.completeCall(appointmentId: any(named: 'appointmentId')))
          .thenThrow(Exception('db'));

      final result = await repository.completeCall(appointmentId: tAppointmentId);
      expect(result, isA<Left<Failure, void>>());
    });
  });
}
