import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../appointment/presentation/providers/appointment_provider.dart';
import '../../data/repositories/vet_repository_impl.dart';
import '../../domain/entities/vet_statistics.dart';
import '../../domain/repositories/vet_repository.dart';
import '../../domain/usecases/get_vet_statistics_usecase.dart';

part 'vet_provider.g.dart';

// Repository
@riverpod
VetRepository vetRepository(Ref ref) {
  final appointmentRepository = ref.watch(appointmentRepositoryProvider);
  return VetRepositoryImpl(appointmentRepository: appointmentRepository);
}

// Use Cases
@riverpod
GetVetStatisticsUseCase getVetStatisticsUseCase(Ref ref) {
  final repository = ref.watch(vetRepositoryProvider);
  return GetVetStatisticsUseCase(repository);
}

// Statistics Provider (with caching)
@Riverpod(keepAlive: true)
Future<VetStatistics> vetStatistics(Ref ref, String vetId) async {
  final useCase = ref.watch(getVetStatisticsUseCaseProvider);
  final result = await useCase(GetVetStatisticsParams(vetId: vetId));

  return result.fold(
    (failure) => throw Exception(failure.message),
    (stats) => stats,
  );
}
