import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/vet_entity.dart';
import '../repositories/vet_repository.dart';

class GetSosNearestVetUseCase implements UseCase<VetEntity?, GetSosNearestVetParams> {
  final VetRepository repository;

  GetSosNearestVetUseCase(this.repository);

  @override
  Future<Either<Failure, VetEntity?>> call(GetSosNearestVetParams params) {
    return repository.getSosNearestVet(
      latitude: params.latitude,
      longitude: params.longitude,
    );
  }
}

class GetSosNearestVetParams extends Equatable {
  final double latitude;
  final double longitude;

  const GetSosNearestVetParams({
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object?> get props => [latitude, longitude];
}
