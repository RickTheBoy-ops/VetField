import 'package:supabase_flutter/supabase_flutter.dart';
import '../../domain/entities/health_event_entity.dart';

abstract class HealthRemoteDataSource {
  Future<List<HealthEventEntity>> getEventsByOwner(String ownerId);
  Future<HealthEventEntity> addEvent({
    required HealthEventType type,
    required DateTime date,
    String? details,
    String? petId,
    String? attachmentUrl,
  });
  Future<HealthEventEntity> updateEvent(HealthEventEntity event);
  Future<void> deleteEvent(String id);
}

class HealthRemoteDataSourceImpl implements HealthRemoteDataSource {
  final SupabaseClient client;

  HealthRemoteDataSourceImpl(this.client);

  @override
  Future<List<HealthEventEntity>> getEventsByOwner(String ownerId) async {
    final response = await client
        .from('health_events')
        .select()
        .eq('owner_id', ownerId)
        .order('date', ascending: false);
    return (response as List)
        .map((e) => HealthEventEntity.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<HealthEventEntity> addEvent({
    required HealthEventType type,
    required DateTime date,
    String? details,
    String? petId,
    String? attachmentUrl,
  }) async {
    final user = client.auth.currentUser;
    if (user == null) throw Exception('Usuário não autenticado');
    final response = await client
        .from('health_events')
        .insert({
          'owner_id': user.id,
          'type': type.name,
          'date': date.toIso8601String(),
          'details': details,
          'pet_id': petId,
          'attachment_url': attachmentUrl,
        })
        .select()
        .single();
    return HealthEventEntity.fromJson(response);
  }

  @override
  Future<HealthEventEntity> updateEvent(HealthEventEntity event) async {
    final response = await client
        .from('health_events')
        .update({
          'type': event.type.name,
          'date': event.date.toIso8601String(),
          'details': event.details,
          'pet_id': event.petId,
          'attachment_url': event.attachmentUrl,
        })
        .eq('id', event.id)
        .select()
        .single();
    return HealthEventEntity.fromJson(response);
  }

  @override
  Future<void> deleteEvent(String id) async {
    await client.from('health_events').delete().eq('id', id);
  }
}
