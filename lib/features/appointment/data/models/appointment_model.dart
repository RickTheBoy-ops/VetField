// ignore_for_file: overridden_fields
import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/appointment_entity.dart';

class AppointmentModel extends AppointmentEntity {
  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'owner_id')
  final String ownerId;

  @override
  @JsonKey(name: 'vet_id')
  final String vetId;

  @override
  @JsonKey(name: 'pet_id')
  final String? petId;

  @override
  @JsonKey(name: 'pet_name')
  final String petName;

  @override
  @JsonKey(name: 'date_time', fromJson: _fromIso, toJson: _toIso)
  final DateTime dateTime;

  @override
  @JsonKey(name: 'vet_name', includeIfNull: false)
  final String? vetName;

  @override
  @JsonKey(name: 'owner_name', includeIfNull: false)
  final String? ownerName;

  @override
  @JsonKey(name: 'pet_photo_url', includeIfNull: false)
  final String? petPhotoUrl;

  @override
  @JsonKey(name: 'pet_species', includeIfNull: false)
  final String? petSpecies;

  @override
  @JsonKey(name: 'pet_breed', includeIfNull: false)
  final String? petBreed;

  @override
  @JsonKey(name: 'status')
  final AppointmentStatus status;

  @override
  @JsonKey(name: 'type')
  final AppointmentType type;

  @override
  @JsonKey(name: 'notes')
  final String? notes;

  @override
  @JsonKey(name: 'price')
  final double price;

  const AppointmentModel({
    required this.id,
    required this.ownerId,
    required this.vetId,
    this.petId,
    required this.petName,
    required this.dateTime,
    required this.status,
    required this.type,
    this.notes,
    required this.price,
    this.vetName,
    this.ownerName,
    this.petPhotoUrl,
    this.petSpecies,
    this.petBreed,
  }) : super(
          id: id,
          ownerId: ownerId,
          vetId: vetId,
          petId: petId,
          petName: petName,
          dateTime: dateTime,
          status: status,
          type: type,
          notes: notes,
          price: price,
          vetName: vetName,
          ownerName: ownerName,
          petPhotoUrl: petPhotoUrl,
          petSpecies: petSpecies,
          petBreed: petBreed,
        );

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      id: json['id'] as String,
      ownerId: json['owner_id'] as String,
      vetId: json['vet_id'] as String,
      petId: json['pet_id'] as String?,
      petName: json['pet_name'] as String? ?? '',
      dateTime: _fromIso(json['date_time'] as String),
      status: AppointmentStatus.values.firstWhere(
        (e) => e.name == (json['status'] as String),
        orElse: () => AppointmentStatus.confirmed,
      ),
      type: AppointmentType.values.firstWhere(
        (e) => e.name == (json['type'] as String),
        orElse: () => AppointmentType.consultation,
      ),
      notes: json['notes'] as String?,
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      vetName: json['vet_name'] as String?,
      ownerName: json['owner_name'] as String?,
      petPhotoUrl: json['pet_photo_url'] as String?,
      petSpecies: json['pet_species'] as String?,
      petBreed: json['pet_breed'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'owner_id': ownerId,
        'vet_id': vetId,
        'pet_id': petId,
        'pet_name': petName,
        'date_time': _toIso(dateTime),
        'status': status.name,
        'type': type.name,
        'notes': notes,
        'price': price,
        'vet_name': vetName,
        'owner_name': ownerName,
        'pet_photo_url': petPhotoUrl,
        'pet_species': petSpecies,
        'pet_breed': petBreed,
      };

  static DateTime _fromIso(String value) => DateTime.parse(value);
  static String _toIso(DateTime value) => value.toIso8601String();
}
