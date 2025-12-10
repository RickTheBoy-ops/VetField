import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/supabase_provider.dart';
import '../../data/datasources/call_remote_datasource.dart';
import '../../data/repositories/call_repository_impl.dart';
import '../../domain/repositories/call_repository.dart';

part 'call_provider.g.dart';

@Riverpod(keepAlive: true)
CallRemoteDataSource callRemoteDataSource(Ref ref) {
  final client = ref.watch(supabaseClientProvider);
  return CallRemoteDataSourceImpl(client);
}

@Riverpod(keepAlive: true)
CallRepository callRepository(Ref ref) {
  final remote = ref.watch(callRemoteDataSourceProvider);
  return CallRepositoryImpl(remote);
}

@Riverpod(keepAlive: true)
class CallController extends _$CallController {
  @override
  FutureOr<void> build() {}

  Future<String> startOrJoin({
    required String appointmentId,
    required String ownerId,
    required String vetId,
  }) async {
    final repo = ref.read(callRepositoryProvider);
    final result = await repo.startOrJoinCall(
      appointmentId: appointmentId,
      ownerId: ownerId,
      vetId: vetId,
    );
    return result.fold((l) => throw Exception(l.message), (url) => url);
  }

  Future<void> complete({required String appointmentId}) async {
    final repo = ref.read(callRepositoryProvider);
    final result = await repo.completeCall(appointmentId: appointmentId);
    result.fold((l) => throw Exception(l.message), (_) => null);
  }
}
