import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/vet_entity.dart';
import '../../domain/repositories/vet_repository.dart';
import '../datasources/owner_local_datasource.dart';
import '../datasources/vet_remote_datasource.dart';

class VetRepositoryImpl implements VetRepository {
  final VetRemoteDataSource remoteDataSource;
  final OwnerLocalDataSource localDataSource;

  VetRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<VetEntity>>> getNearbyVets({
    required double latitude,
    required double longitude,
    required double radiusKm,
  }) async {
    try {
      final vets = await remoteDataSource.getNearbyVets(latitude, longitude, radiusKm);
      await localDataSource.cacheVets(vets);
      return Right(vets);
    } catch (e) {
      try {
        final cachedVets = await localDataSource.getCachedVets();
        if (cachedVets.isNotEmpty) {
          return Right(cachedVets);
        }
      } catch (_) {}
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<VetEntity>>> searchVets({
    String? query,
    String? specialty,
    double? maxPrice,
    double? minRating,
    double? lat,
    double? lng,
    double? radiusKm,
  }) async {
    try {
      final vets = await remoteDataSource.searchVets(
        query: query,
        specialty: specialty,
        maxPrice: maxPrice,
        minRating: minRating,
        lat: lat,
        lng: lng,
        radiusKm: radiusKm,
      );
      return Right(vets);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, VetEntity?>> getSosNearestVet({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final vet = await remoteDataSource.getSosNearestVet(latitude, longitude);
      return Right(vet);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

