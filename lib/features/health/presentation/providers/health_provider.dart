import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/supabase_provider.dart';
import '../../data/datasources/health_remote_datasource.dart';
import '../../data/datasources/health_local_datasource.dart';
import '../../data/repositories/health_repository_impl.dart';
import '../../domain/repositories/health_repository.dart';
import '../../domain/entities/health_event_entity.dart';
import '../../domain/usecases/get_health_events_usecase.dart';
import '../../domain/usecases/add_health_event_usecase.dart';

part 'health_provider.g.dart';

@riverpod
HealthRemoteDataSource healthRemoteDataSource(Ref ref) {
  final client = ref.watch(supabaseClientProvider);
  return HealthRemoteDataSourceImpl(client);
}

@riverpod
HealthLocalDataSource healthLocalDataSource(Ref ref) {
  return HealthLocalDataSourceImpl();
}

@riverpod
HealthRepository healthRepository(Ref ref) {
  final remote = ref.watch(healthRemoteDataSourceProvider);
  final local = ref.watch(healthLocalDataSourceProvider);
  return HealthRepositoryImpl(
    remoteDataSource: remote,
    localDataSource: local,
  );
}

@riverpod
GetHealthEventsUseCase getHealthEventsUseCase(Ref ref) {
  final repo = ref.watch(healthRepositoryProvider);
  return GetHealthEventsUseCase(repo);
}

@riverpod
AddHealthEventUseCase addHealthEventUseCase(Ref ref) {
  final repo = ref.watch(healthRepositoryProvider);
  return AddHealthEventUseCase(repo);
}

@riverpod
class HealthTimelineController extends _$HealthTimelineController {
  @override
  FutureOr<List<HealthEventEntity>> build() async {
    final client = ref.read(supabaseClientProvider);
    final user = client.auth.currentUser;
    if (user == null) return [];
    final useCase = ref.read(getHealthEventsUseCaseProvider);
    final result = await useCase(user.id);
    return result.fold((f) => [], (events) => events);
  }

  Future<void> addEvent(AddHealthEventParams params) async {
    final useCase = ref.read(addHealthEventUseCaseProvider);
    final result = await useCase(params);
    result.fold((f) {}, (_) => ref.invalidateSelf());
  }
}
