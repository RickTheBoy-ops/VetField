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

@Riverpod(keepAlive: true)
HealthRemoteDataSource healthRemoteDataSource(Ref ref) {
  final client = ref.watch(supabaseClientProvider);
  return HealthRemoteDataSourceImpl(client);
}

@Riverpod(keepAlive: true)
HealthLocalDataSource healthLocalDataSource(Ref ref) {
  return HealthLocalDataSourceImpl();
}

@Riverpod(keepAlive: true)
HealthRepository healthRepository(Ref ref) {
  final remote = ref.watch(healthRemoteDataSourceProvider);
  final local = ref.watch(healthLocalDataSourceProvider);
  return HealthRepositoryImpl(remoteDataSource: remote, localDataSource: local);
}

@Riverpod(keepAlive: true)
GetHealthEventsUseCase getHealthEventsUseCase(Ref ref) {
  final repo = ref.watch(healthRepositoryProvider);
  return GetHealthEventsUseCase(repo);
}

@Riverpod(keepAlive: true)
AddHealthEventUseCase addHealthEventUseCase(Ref ref) {
  final repo = ref.watch(healthRepositoryProvider);
  return AddHealthEventUseCase(repo);
}

@Riverpod(keepAlive: true)
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
