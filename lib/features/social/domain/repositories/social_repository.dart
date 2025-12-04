import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/social_pet_entity.dart';

abstract class SocialRepository {
  Future<Either<Failure, List<SocialPet>>> getNearbyPets({
    required double latitude,
    required double longitude,
    double radiusKm = 2.0,
  });
  
  Future<Either<Failure, void>> checkIn({
    required double latitude,
    required double longitude,
  });
  
  Future<Either<Failure, void>> checkOut();
}
