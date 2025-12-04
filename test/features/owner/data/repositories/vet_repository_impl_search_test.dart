import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vetfield_flutter/core/error/failures.dart';
import 'package:vetfield_flutter/features/owner/data/datasources/vet_remote_datasource.dart';
import 'package:vetfield_flutter/features/owner/data/datasources/owner_local_datasource.dart';
import 'package:vetfield_flutter/features/owner/domain/entities/vet_entity.dart';
import 'package:vetfield_flutter/features/owner/data/repositories/vet_repository_impl.dart';

class _MockVetRemoteDataSource extends Mock implements VetRemoteDataSource {}
class _MockOwnerLocalDataSource extends Mock implements OwnerLocalDataSource {}

void main() {
  late VetRepositoryImpl repository;
  late _MockVetRemoteDataSource remote;
  late _MockOwnerLocalDataSource local;

  setUp(() {
    remote = _MockVetRemoteDataSource();
    local = _MockOwnerLocalDataSource();
    repository = VetRepositoryImpl(
      remoteDataSource: remote,
      localDataSource: local,
    );
  });

  test('searchVets passes radius filter to remote', () async {
    final vet = const VetEntity(
      id: '1',
      name: 'Dr. Pet',
      specialty: 'Clínico',
      address: 'Rua A',
      rating: 4.5,
      latitude: -23.54,
      longitude: -46.62,
      avatarUrl: 'url',
      price: 100.0,
    );
    when(() => remote.searchVets(
          query: any(named: 'query'),
          specialty: any(named: 'specialty'),
          maxPrice: any(named: 'maxPrice'),
          minRating: any(named: 'minRating'),
          lat: any(named: 'lat'),
          lng: any(named: 'lng'),
          radiusKm: any(named: 'radiusKm'),
        )).thenAnswer((_) async => [vet]);

    final result = await repository.searchVets(
      query: 'pet',
      specialty: 'Clínico',
      maxPrice: 150,
      minRating: 4.0,
      lat: -23.55,
      lng: -46.63,
      radiusKm: 10,
    );

    expect(result.isRight(), true);
    verify(() => remote.searchVets(
          query: 'pet',
          specialty: 'Clínico',
          maxPrice: 150,
          minRating: 4.0,
          lat: -23.55,
          lng: -46.63,
          radiusKm: 10,
        )).called(1);
  });

  test('searchVets returns failure when remote throws', () async {
    when(() => remote.searchVets()).thenThrow(Exception('err'));
    final result = await repository.searchVets();
    expect(result, isA<Left<Failure, dynamic>>());
  });
}
