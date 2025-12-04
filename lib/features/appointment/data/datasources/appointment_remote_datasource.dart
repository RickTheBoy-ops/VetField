import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/appointment_model.dart';
import '../../domain/entities/appointment_entity.dart';

abstract class AppointmentRemoteDataSource {
  Future<AppointmentModel> createAppointment({
    required String vetId,
    String? petId,
    required String petName,
    required DateTime dateTime,
    required AppointmentType type,
    String? notes,
  });

  Future<List<AppointmentModel>> getVetAppointments(String vetId);
  Future<List<AppointmentModel>> getOwnerAppointments(String ownerId);
  
  Future<void> updateAppointmentStatus(String id, AppointmentStatus status);
  Future<void> updateAppointmentDateTime(String id, DateTime newDateTime);
}

class AppointmentRemoteDataSourceImpl implements AppointmentRemoteDataSource {
  final SupabaseClient supabaseClient;

  AppointmentRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<AppointmentModel> createAppointment({
    required String vetId,
    String? petId,
    required String petName,
    required DateTime dateTime,
    required AppointmentType type,
    String? notes,
  }) async {
    final user = supabaseClient.auth.currentUser;
    if (user == null) throw Exception('Usuário não autenticado');

    // Simulação de preço base por tipo
    double price = 0.0;
    switch (type) {
      case AppointmentType.consultation: price = 150.0; break;
      case AppointmentType.vaccine: price = 80.0; break;
      case AppointmentType.exam: price = 200.0; break;
      case AppointmentType.surgery: price = 1000.0; break;
    }

    final response = await supabaseClient
        .from('appointments')
        .insert({
          'owner_id': user.id,
          'vet_id': vetId,
          'pet_id': petId,
          'pet_name': petName,
          'date_time': dateTime.toIso8601String(),
          'status': AppointmentStatus.pending.name,
          'type': type.name,
          'notes': notes,
          'price': price,
        })
        .select()
        .single();

    return AppointmentModel.fromJson(response);
  }

  @override
  Future<List<AppointmentModel>> getVetAppointments(String vetId) async {
    final response = await supabaseClient
        .from('appointments')
        .select('*, profiles:owner_id(name), pets:pet_id(name, photo_url, species, breed)')
        .eq('vet_id', vetId)
        .order('date_time');

    return (response as List).map((json) {
      final ownerName = json['profiles'] != null ? json['profiles']['name'] : 'Desconhecido';
      final petName = json['pets'] != null ? json['pets']['name'] : json['pet_name'];
      final petPhotoUrl = json['pets'] != null ? json['pets']['photo_url'] : null;
      final petSpecies = json['pets'] != null ? json['pets']['species'] : null;
      final petBreed = json['pets'] != null ? json['pets']['breed'] : null;
      final Map<String, dynamic> data = Map.from(json);
      data['owner_name'] = ownerName;
      data['pet_name'] = petName;
      data['pet_photo_url'] = petPhotoUrl;
      data['pet_species'] = petSpecies;
      data['pet_breed'] = petBreed;

      return AppointmentModel.fromJson(data);
    }).toList();
  }

  @override
  Future<List<AppointmentModel>> getOwnerAppointments(String ownerId) async {
    final response = await supabaseClient
        .from('appointments')
        .select('*, vets:vet_id(name, avatar_url, specialty), pets:pet_id(name, photo_url, species, breed)')
        .eq('owner_id', ownerId)
        .order('date_time');

    return (response as List).map((json) {
      final vetName = json['vets'] != null ? json['vets']['name'] : 'Veterinário';
      final petName = json['pets'] != null ? json['pets']['name'] : json['pet_name'];
      final petPhotoUrl = json['pets'] != null ? json['pets']['photo_url'] : null;
      final petSpecies = json['pets'] != null ? json['pets']['species'] : null;
      final petBreed = json['pets'] != null ? json['pets']['breed'] : null;
      final Map<String, dynamic> data = Map.from(json);
      data['vet_name'] = vetName;
      data['pet_name'] = petName;
      data['pet_photo_url'] = petPhotoUrl;
      data['pet_species'] = petSpecies;
      data['pet_breed'] = petBreed;
      return AppointmentModel.fromJson(data);
    }).toList();
  }

  @override
  Future<void> updateAppointmentStatus(String id, AppointmentStatus status) async {
    await supabaseClient
        .from('appointments')
        .update({'status': status.name})
        .eq('id', id);
  }

  @override
  Future<void> updateAppointmentDateTime(String id, DateTime newDateTime) async {
    await supabaseClient
        .from('appointments')
        .update({'date_time': newDateTime.toIso8601String()})
        .eq('id', id);
  }
}
