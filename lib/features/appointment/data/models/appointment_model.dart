// ignore_for_file: overridden_fields
import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';
import '../../domain/entities/appointment_entity.dart';

part 'appointment_model.g.dart';

@HiveType(typeId: 0)

@JsonSerializable()
class AppointmentModel extends AppointmentEntity {
  @override
  @JsonKey(name: 'id')
  @HiveField(5)
  final String id;
  @override
  @JsonKey(name: 'owner_id')
  @HiveField(0)
  final String ownerId;

  @override
  @JsonKey(name: 'vet_id')
  @HiveField(1)
  final String vetId;

  @override
  @JsonKey(name: 'pet_id')
  @HiveField(4)
  final String? petId;

  @override
  @JsonKey(name: 'pet_name')
  @HiveField(2)
  final String petName;

  @override
  @JsonKey(name: 'date_time', fromJson: _fromIso, toJson: _toIso)
  @HiveField(3)
  final DateTime dateTime;

  @override
  @JsonKey(name: 'vet_name', includeIfNull: false)
  @HiveField(6)
  final String? vetName;

  @override
  @JsonKey(name: 'owner_name', includeIfNull: false)
  @HiveField(7)
  final String? ownerName;

  @override
  @JsonKey(name: 'status')
  @HiveField(8)
  final AppointmentStatus status;

  @override
  @JsonKey(name: 'type')
  @HiveField(9)
  final AppointmentType type;

  @override
  @JsonKey(name: 'notes')
  @HiveField(10)
  final String? notes;

  @override
  @JsonKey(name: 'price')
  @HiveField(11)
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
        );

  factory AppointmentModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentModelToJson(this);

  static DateTime _fromIso(String value) => DateTime.parse(value);
  static String _toIso(DateTime value) => value.toIso8601String();
}
