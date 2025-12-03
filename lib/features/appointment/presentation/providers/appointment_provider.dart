import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/supabase_provider.dart';
import '../../data/datasources/appointment_remote_datasource.dart';
import '../../data/repositories/appointment_repository_impl.dart';
import '../../domain/entities/appointment_entity.dart';
import '../../domain/repositories/appointment_repository.dart';
import '../../domain/usecases/create_appointment_usecase.dart';
import '../../domain/usecases/update_appointment_status_usecase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'appointment_provider.g.dart';

@riverpod
AppointmentRemoteDataSource appointmentRemoteDataSource(Ref ref) {
  final supabaseClient = ref.watch(supabaseClientProvider);
  return AppointmentRemoteDataSourceImpl(supabaseClient);
}

@riverpod
AppointmentRepository appointmentRepository(Ref ref) {
  final remoteDataSource = ref.watch(appointmentRemoteDataSourceProvider);
  return AppointmentRepositoryImpl(remoteDataSource: remoteDataSource);
}

@riverpod
CreateAppointmentUseCase createAppointmentUseCase(Ref ref) {
  final repository = ref.watch(appointmentRepositoryProvider);
  return CreateAppointmentUseCase(repository);
}

@riverpod
UpdateAppointmentStatusUseCase updateAppointmentStatusUseCase(Ref ref) {
  final repository = ref.watch(appointmentRepositoryProvider);
  return UpdateAppointmentStatusUseCase(repository);
}

@riverpod
class AppointmentController extends _$AppointmentController {
  @override
  FutureOr<void> build() {
    // void
  }

  Future<void> createAppointment({
    required String vetId,
    required String petName,
    required DateTime dateTime,
    required AppointmentType type,
    String? notes,
  }) async {
    state = const AsyncValue.loading();
    
    final useCase = ref.read(createAppointmentUseCaseProvider);
    final result = await useCase(CreateAppointmentParams(
      vetId: vetId,
      petName: petName,
      dateTime: dateTime,
      type: type,
      notes: notes,
    ));

    result.fold(
      (failure) => state = AsyncValue.error(failure.message, StackTrace.current),
      (success) => state = const AsyncValue.data(null),
    );
  }

  Future<void> updateStatus({required String id, required AppointmentStatus status}) async {
    state = const AsyncValue.loading();
    final useCase = ref.read(updateAppointmentStatusUseCaseProvider);
    final result = await useCase(UpdateAppointmentStatusParams(appointmentId: id, status: status));
    result.fold(
      (failure) => state = AsyncValue.error(failure.message, StackTrace.current),
      (_) => state = const AsyncValue.data(null),
    );
  }
}

// Provider para listar agendamentos do vet
@riverpod
Future<List<AppointmentEntity>> vetAppointments(Ref ref, String vetId) async {
  final repository = ref.watch(appointmentRepositoryProvider);
  final result = await repository.getVetAppointments(vetId);
  
  return result.fold(
    (failure) => throw Exception(failure.message),
    (appointments) => appointments,
  );
}

@riverpod
Future<List<AppointmentEntity>> ownerAppointments(Ref ref, String ownerId) async {
  final repository = ref.watch(appointmentRepositoryProvider);
  final result = await repository.getOwnerAppointments(ownerId);
  return result.fold(
    (failure) => throw Exception(failure.message),
    (appointments) => appointments,
  );
}

@riverpod
class OwnerAppointmentsRealtime extends _$OwnerAppointmentsRealtime {
  RealtimeChannel? _channel;

  @override
  FutureOr<void> build() {
    ref.onDispose(() {
      _channel?.unsubscribe();
    });
  }

  Future<void> subscribe(String ownerId) async {
    final client = ref.read(supabaseClientProvider);
    _channel?.unsubscribe();
    _channel = client
        .channel('public:appointments')
        .onPostgresChanges(
          event: PostgresChangeEvent.all,
          schema: 'public',
          table: 'appointments',
          callback: (payload) {
            final newOwnerId = payload.newRecord['owner_id'];
            final oldOwnerId = payload.oldRecord['owner_id'];
            if (newOwnerId == ownerId || oldOwnerId == ownerId) {
              ref.invalidate(ownerAppointmentsProvider(ownerId));
            }
          },
        )
        .subscribe();
  }
}
@riverpod
class VetAppointmentsRealtime extends _$VetAppointmentsRealtime {
  RealtimeChannel? _channel;

  @override
  FutureOr<void> build() {
    ref.onDispose(() {
      _channel?.unsubscribe();
    });
  }

  Future<void> subscribe(String vetId) async {
    final client = ref.read(supabaseClientProvider);
    _channel?.unsubscribe();
    _channel = client
        .channel('public:appointments')
        .onPostgresChanges(
          event: PostgresChangeEvent.all,
          schema: 'public',
          table: 'appointments',
          callback: (payload) {
            final newVetId = payload.newRecord['vet_id'];
            final oldVetId = payload.oldRecord['vet_id'];
            if (newVetId == vetId || oldVetId == vetId) {
              ref.invalidate(vetAppointmentsProvider(vetId));
            }
          },
        )
        .subscribe();
  }
}
