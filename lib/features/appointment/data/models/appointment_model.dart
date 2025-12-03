// ignore_for_file: overridden_fields
import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/appointment_entity.dart';

part 'appointment_model.g.dart';

@JsonSerializable()
class AppointmentModel extends AppointmentEntity {
  @override
  @JsonKey(name: 'owner_id')
  final String ownerId;

  @override
  @JsonKey(name: 'vet_id')
  final String vetId;

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

  const AppointmentModel({
    required super.id,
    required this.ownerId,
    required this.vetId,
    required this.petName,
    required this.dateTime,
    required super.status,
    required super.type,
    super.notes,
    required super.price,
    this.vetName,
    this.ownerName,
  }) : super(
          ownerId: ownerId,
          vetId: vetId,
          petName: petName,
          dateTime: dateTime,
          vetName: vetName,
          ownerName: ownerName,
        );

  factory AppointmentModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentModelToJson(this);

  static DateTime _fromIso(String value) => DateTime.parse(value);
  static String _toIso(DateTime value) => value.toIso8601String();
}
