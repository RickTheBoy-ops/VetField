import 'package:supabase_flutter/supabase_flutter.dart';

abstract class CallRemoteDataSource {
  Future<String> startOrJoinCall({
    required String appointmentId,
    required String ownerId,
    required String vetId,
  });
}

class CallRemoteDataSourceImpl implements CallRemoteDataSource {
  final SupabaseClient client;
  CallRemoteDataSourceImpl(this.client);

  @override
  Future<String> startOrJoinCall({
    required String appointmentId,
    required String ownerId,
    required String vetId,
  }) async {
    final existing = await client
        .from('video_calls')
        .select()
        .eq('appointment_id', appointmentId)
        .limit(1);
    if (existing.isNotEmpty) {
      final room = existing.first['room_name'] as String;
      return 'https://meet.jit.si/$room';
    }
    final room = 'VetField-${appointmentId.substring(0, 8)}-${DateTime.now().millisecondsSinceEpoch}';
    final inserted = await client
        .from('video_calls')
        .insert({
          'appointment_id': appointmentId,
          'owner_id': ownerId,
          'vet_id': vetId,
          'room_name': room,
          'status': 'active',
        })
        .select()
        .single();
    final name = inserted['room_name'] as String;
    return 'https://meet.jit.si/$name';
  }
}
