import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/vet_entity.dart';

abstract class VetRepository {
  Future<Either<Failure, List<VetEntity>>> getNearbyVets({
    required double latitude,
    required double longitude,
    required double radiusKm,
  });
  
  Future<Either<Failure, List<VetEntity>>> searchVets({
    String? query,
    String? specialty,
    double? maxPrice,
    double? minRating,
    double? lat,
    double? lng,
    double? radiusKm,
  });

  Future<Either<Failure, VetEntity?>> getSosNearestVet({
    required double latitude,
    required double longitude,
  });
}
