// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'health_event_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HealthEventEntity _$HealthEventEntityFromJson(Map<String, dynamic> json) {
  return _HealthEventEntity.fromJson(json);
}

/// @nodoc
mixin _$HealthEventEntity {
  String get id => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;
  String? get petId => throw _privateConstructorUsedError;
  HealthEventType get type => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String? get details => throw _privateConstructorUsedError;
  String? get vetId => throw _privateConstructorUsedError;
  String? get attachmentUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HealthEventEntityCopyWith<HealthEventEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HealthEventEntityCopyWith<$Res> {
  factory $HealthEventEntityCopyWith(
          HealthEventEntity value, $Res Function(HealthEventEntity) then) =
      _$HealthEventEntityCopyWithImpl<$Res, HealthEventEntity>;
  @useResult
  $Res call(
      {String id,
      String ownerId,
      String? petId,
      HealthEventType type,
      DateTime date,
      String? details,
      String? vetId,
      String? attachmentUrl});
}

/// @nodoc
class _$HealthEventEntityCopyWithImpl<$Res, $Val extends HealthEventEntity>
    implements $HealthEventEntityCopyWith<$Res> {
  _$HealthEventEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ownerId = null,
    Object? petId = freezed,
    Object? type = null,
    Object? date = null,
    Object? details = freezed,
    Object? vetId = freezed,
    Object? attachmentUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      petId: freezed == petId
          ? _value.petId
          : petId // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as HealthEventType,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
      vetId: freezed == vetId
          ? _value.vetId
          : vetId // ignore: cast_nullable_to_non_nullable
              as String?,
      attachmentUrl: freezed == attachmentUrl
          ? _value.attachmentUrl
          : attachmentUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HealthEventEntityImplCopyWith<$Res>
    implements $HealthEventEntityCopyWith<$Res> {
  factory _$$HealthEventEntityImplCopyWith(_$HealthEventEntityImpl value,
          $Res Function(_$HealthEventEntityImpl) then) =
      __$$HealthEventEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String ownerId,
      String? petId,
      HealthEventType type,
      DateTime date,
      String? details,
      String? vetId,
      String? attachmentUrl});
}

/// @nodoc
class __$$HealthEventEntityImplCopyWithImpl<$Res>
    extends _$HealthEventEntityCopyWithImpl<$Res, _$HealthEventEntityImpl>
    implements _$$HealthEventEntityImplCopyWith<$Res> {
  __$$HealthEventEntityImplCopyWithImpl(_$HealthEventEntityImpl _value,
      $Res Function(_$HealthEventEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ownerId = null,
    Object? petId = freezed,
    Object? type = null,
    Object? date = null,
    Object? details = freezed,
    Object? vetId = freezed,
    Object? attachmentUrl = freezed,
  }) {
    return _then(_$HealthEventEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      petId: freezed == petId
          ? _value.petId
          : petId // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as HealthEventType,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
      vetId: freezed == vetId
          ? _value.vetId
          : vetId // ignore: cast_nullable_to_non_nullable
              as String?,
      attachmentUrl: freezed == attachmentUrl
          ? _value.attachmentUrl
          : attachmentUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HealthEventEntityImpl implements _HealthEventEntity {
  const _$HealthEventEntityImpl(
      {required this.id,
      required this.ownerId,
      this.petId,
      required this.type,
      required this.date,
      this.details,
      this.vetId,
      this.attachmentUrl});

  factory _$HealthEventEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$HealthEventEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String ownerId;
  @override
  final String? petId;
  @override
  final HealthEventType type;
  @override
  final DateTime date;
  @override
  final String? details;
  @override
  final String? vetId;
  @override
  final String? attachmentUrl;

  @override
  String toString() {
    return 'HealthEventEntity(id: $id, ownerId: $ownerId, petId: $petId, type: $type, date: $date, details: $details, vetId: $vetId, attachmentUrl: $attachmentUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HealthEventEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.petId, petId) || other.petId == petId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.vetId, vetId) || other.vetId == vetId) &&
            (identical(other.attachmentUrl, attachmentUrl) ||
                other.attachmentUrl == attachmentUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, ownerId, petId, type, date,
      details, vetId, attachmentUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HealthEventEntityImplCopyWith<_$HealthEventEntityImpl> get copyWith =>
      __$$HealthEventEntityImplCopyWithImpl<_$HealthEventEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HealthEventEntityImplToJson(
      this,
    );
  }
}

abstract class _HealthEventEntity implements HealthEventEntity {
  const factory _HealthEventEntity(
      {required final String id,
      required final String ownerId,
      final String? petId,
      required final HealthEventType type,
      required final DateTime date,
      final String? details,
      final String? vetId,
      final String? attachmentUrl}) = _$HealthEventEntityImpl;

  factory _HealthEventEntity.fromJson(Map<String, dynamic> json) =
      _$HealthEventEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get ownerId;
  @override
  String? get petId;
  @override
  HealthEventType get type;
  @override
  DateTime get date;
  @override
  String? get details;
  @override
  String? get vetId;
  @override
  String? get attachmentUrl;
  @override
  @JsonKey(ignore: true)
  _$$HealthEventEntityImplCopyWith<_$HealthEventEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
