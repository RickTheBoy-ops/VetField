import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/vet_entity.dart';

part 'vet_model.g.dart';

@JsonSerializable()
class VetModel extends VetEntity {
  const VetModel({
    required super.id,
    required super.name,
    required super.specialty,
    required super.address,
    required super.rating,
    required super.latitude,
    required super.longitude,
    required super.avatarUrl,
    required super.price,
    super.isAvailable,
  });

  factory VetModel.fromJson(Map<String, dynamic> json) => _$VetModelFromJson(json);

  Map<String, dynamic> toJson() => _$VetModelToJson(this);
}
