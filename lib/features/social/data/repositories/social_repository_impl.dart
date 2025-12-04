import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/social_pet_entity.dart';
import '../../domain/repositories/social_repository.dart';
import '../datasources/social_remote_datasource.dart';

class SocialRepositoryImpl implements SocialRepository {
  final SocialRemoteDataSource remoteDataSource;

  SocialRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<SocialPet>>> getNearbyPets({
    required double latitude,
    required double longitude,
    double radiusKm = 2.0,
  }) async {
    try {
      final pets = await remoteDataSource.getNearbyPets(
        latitude: latitude,
        longitude: longitude,
        radiusKm: radiusKm,
      );
      return Right(pets);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> checkIn({
    required double latitude,
    required double longitude,
  }) async {
    try {
      // Get current user ID from auth
      // For now, we'll need to pass userId from controller
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> checkOut() async {
    try {
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
