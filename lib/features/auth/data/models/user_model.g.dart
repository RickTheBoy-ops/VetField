// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  id: json['id'] as String,
  email: json['email'] as String,
  name: json['name'] as String,
  type: $enumDecode(_$UserTypeEnumMap, json['type']),
  avatarUrl: json['avatarUrl'] as String?,
  crmv: json['crmv'] as String?,
  cpf: json['cpf'] as String?,
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'name': instance.name,
  'type': _$UserTypeEnumMap[instance.type]!,
  'avatarUrl': instance.avatarUrl,
  'crmv': instance.crmv,
  'cpf': instance.cpf,
};

const _$UserTypeEnumMap = {UserType.vet: 'vet', UserType.owner: 'owner'};
