import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vetfield_flutter/core/error/failures.dart';
import 'package:vetfield_flutter/features/owner/data/datasources/vet_remote_datasource.dart';
import 'package:vetfield_flutter/features/owner/data/models/vet_model.dart';
import 'package:vetfield_flutter/features/owner/data/repositories/vet_repository_impl.dart';
import 'package:vetfield_flutter/features/owner/domain/entities/vet_entity.dart';

class MockVetRemoteDataSource extends Mock implements VetRemoteDataSource {}

void main() {
  late VetRepositoryImpl repository;
  late MockVetRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockVetRemoteDataSource();
    repository = VetRepositoryImpl(remoteDataSource: mockRemoteDataSource);
  });

  const tLat = -23.55;
  const tLong = -46.63;
  const tRadius = 10.0;

  final tVetModel = VetModel(
    id: '1',
    name: 'Dr. Pet',
    specialty: 'General',
    address: 'Rua A',
    rating: 4.5,
    latitude: -23.54,
    longitude: -46.62,
    avatarUrl: 'url',
    price: 100.0,
  );

  final tVetEntity = tVetModel;
  final tListVetModel = [tVetModel];
  final tListVetEntity = [tVetEntity];

  group('getNearbyVets', () {
    test(
      'should return remote data when the call to remote data source is successful',
      () async {
        // Arrange
        when(() => mockRemoteDataSource.getNearbyVets(any(), any(), any()))
            .thenAnswer((_) async => tListVetModel);

        // Act
        final result = await repository.getNearbyVets(
          latitude: tLat,
          longitude: tLong,
          radiusKm: tRadius,
        );

        // Assert
        verify(() => mockRemoteDataSource.getNearbyVets(tLat, tLong, tRadius));
        expect(result.isRight(), true);
        result.fold(
          (l) => fail('Should be Right'),
          (r) => expect(r, tListVetEntity),
        );
      },
    );

    test(
      'should return server failure when the call to remote data source is unsuccessful',
      () async {
        // Arrange
        when(() => mockRemoteDataSource.getNearbyVets(any(), any(), any()))
            .thenThrow(Exception());

        // Act
        final result = await repository.getNearbyVets(
          latitude: tLat,
          longitude: tLong,
          radiusKm: tRadius,
        );

        // Assert
        verify(() => mockRemoteDataSource.getNearbyVets(tLat, tLong, tRadius));
        expect(result, isA<Left<Failure, List<VetEntity>>>());
      },
    );
  });
}
