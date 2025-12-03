import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:vetfield_flutter/features/owner/domain/entities/vet_entity.dart';
import 'package:vetfield_flutter/features/owner/domain/repositories/vet_repository.dart';
import 'package:vetfield_flutter/features/owner/domain/usecases/get_sos_nearest_vet_usecase.dart';
import 'package:vetfield_flutter/core/error/failures.dart';

class _MockVetRepository extends Mock implements VetRepository {}

void main() {
  late _MockVetRepository repository;
  late GetSosNearestVetUseCase useCase;

  setUp(() {
    repository = _MockVetRepository();
    useCase = GetSosNearestVetUseCase(repository);
  });

  test('retorna VetEntity quando SOS encontra vet', () async {
    const params = GetSosNearestVetParams(latitude: -23.5, longitude: -46.6);
    const vet = VetEntity(
      id: 'v1',
      name: 'Dr. Vet',
      specialty: 'Clínico',
      address: 'Rua A',
      rating: 4.8,
      latitude: -23.5,
      longitude: -46.6,
      avatarUrl: 'http://img',
      price: 100.0,
    );

    when(() => repository.getSosNearestVet(latitude: params.latitude, longitude: params.longitude))
        .thenAnswer((_) async => const Right(vet));

    final result = await useCase(params);
    expect(result.isRight(), true);
    expect(result, const Right(vet));
  });

  test('retorna Failure quando SOS falha', () async {
    const params = GetSosNearestVetParams(latitude: 0, longitude: 0);
    when(() => repository.getSosNearestVet(latitude: params.latitude, longitude: params.longitude))
        .thenAnswer((_) async => Left(ServerFailure('Erro')));

    final result = await useCase(params);
    expect(result.isLeft(), true);
  });
}
