import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/vet_statistics.dart';

/// Repository interface for vet-related operations
abstract class VetRepository {
  /// Get vet statistics for dashboard
  Future<Either<Failure, VetStatistics>> getStatistics(String vetId); 

  /// Get upcoming appointments count
  Future<Either<Failure, int>> getUpcomingAppointmentsCount(String vetId);

  /// Update vet service information (price, specialty, address, etc.)
  Future<Either<Failure, void>> updateServiceInfo({
    required String vetId,
    String? specialty,
    double? price,
    String? address,
    double? latitude,
    double? longitude,
    bool? isAvailable,
  });
}
