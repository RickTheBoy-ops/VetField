import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/vet_entity.dart';
import '../repositories/vet_repository.dart';

class GetNearbyVetsUseCase implements UseCase<List<VetEntity>, GetNearbyVetsParams> {
  final VetRepository repository;

  GetNearbyVetsUseCase(this.repository);

  @override
  Future<Either<Failure, List<VetEntity>>> call(GetNearbyVetsParams params) {
    return repository.getNearbyVets(
      latitude: params.latitude,
      longitude: params.longitude,
      radiusKm: params.radiusKm,
    );
  }
}

class GetNearbyVetsParams extends Equatable {
  final double latitude;
  final double longitude;
  final double radiusKm;

  const GetNearbyVetsParams({
    required this.latitude,
    required this.longitude,
    required this.radiusKm,
  });

  @override
  List<Object?> get props => [latitude, longitude, radiusKm];
}
