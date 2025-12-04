import '../../../appointment/domain/entities/appointment_entity.dart';
import '../models/vet_statistics_model.dart';

/// Remote data source for vet operations
abstract class VetRemoteDataSource {
  Future<VetStatisticsModel> getStatistics(String vetId);
}

class VetRemoteDataSourceImpl implements VetRemoteDataSource {
  @override
  Future<VetStatisticsModel> getStatistics(String vetId) async {
    // In a real implementation, this would fetch from Supabase
    // For now, we compute from appointments (will integrate with appointment provider)
    throw UnimplementedError(
      'VetRemoteDataSource.getStatistics should be called through repository',
    );
  }
}
