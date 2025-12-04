// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'appointment_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppointmentEntity _$AppointmentEntityFromJson(Map<String, dynamic> json) {
  return _AppointmentEntity.fromJson(json);
}

/// @nodoc
mixin _$AppointmentEntity {
  String get id => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;
  String get vetId => throw _privateConstructorUsedError;
  String? get petId => throw _privateConstructorUsedError;
  String get petName => throw _privateConstructorUsedError;
  DateTime get dateTime => throw _privateConstructorUsedError;
  AppointmentStatus get status => throw _privateConstructorUsedError;
  AppointmentType get type => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String? get vetName => throw _privateConstructorUsedError;
  String? get ownerName => throw _privateConstructorUsedError;
  String? get petPhotoUrl => throw _privateConstructorUsedError;
  String? get petSpecies => throw _privateConstructorUsedError;
  String? get petBreed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppointmentEntityCopyWith<AppointmentEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentEntityCopyWith<$Res> {
  factory $AppointmentEntityCopyWith(
          AppointmentEntity value, $Res Function(AppointmentEntity) then) =
      _$AppointmentEntityCopyWithImpl<$Res, AppointmentEntity>;
  @useResult
  $Res call(
      {String id,
      String ownerId,
      String vetId,
      String? petId,
      String petName,
      DateTime dateTime,
      AppointmentStatus status,
      AppointmentType type,
      String? notes,
      double price,
      String? vetName,
      String? ownerName,
      String? petPhotoUrl,
      String? petSpecies,
      String? petBreed});
}

/// @nodoc
class _$AppointmentEntityCopyWithImpl<$Res, $Val extends AppointmentEntity>
    implements $AppointmentEntityCopyWith<$Res> {
  _$AppointmentEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ownerId = null,
    Object? vetId = null,
    Object? petId = freezed,
    Object? petName = null,
    Object? dateTime = null,
    Object? status = null,
    Object? type = null,
    Object? notes = freezed,
    Object? price = null,
    Object? vetName = freezed,
    Object? ownerName = freezed,
    Object? petPhotoUrl = freezed,
    Object? petSpecies = freezed,
    Object? petBreed = freezed,
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
      vetId: null == vetId
          ? _value.vetId
          : vetId // ignore: cast_nullable_to_non_nullable
              as String,
      petId: freezed == petId
          ? _value.petId
          : petId // ignore: cast_nullable_to_non_nullable
              as String?,
      petName: null == petName
          ? _value.petName
          : petName // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AppointmentStatus,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AppointmentType,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      vetName: freezed == vetName
          ? _value.vetName
          : vetName // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerName: freezed == ownerName
          ? _value.ownerName
          : ownerName // ignore: cast_nullable_to_non_nullable
              as String?,
      petPhotoUrl: freezed == petPhotoUrl
          ? _value.petPhotoUrl
          : petPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      petSpecies: freezed == petSpecies
          ? _value.petSpecies
          : petSpecies // ignore: cast_nullable_to_non_nullable
              as String?,
      petBreed: freezed == petBreed
          ? _value.petBreed
          : petBreed // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppointmentEntityImplCopyWith<$Res>
    implements $AppointmentEntityCopyWith<$Res> {
  factory _$$AppointmentEntityImplCopyWith(_$AppointmentEntityImpl value,
          $Res Function(_$AppointmentEntityImpl) then) =
      __$$AppointmentEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String ownerId,
      String vetId,
      String? petId,
      String petName,
      DateTime dateTime,
      AppointmentStatus status,
      AppointmentType type,
      String? notes,
      double price,
      String? vetName,
      String? ownerName,
      String? petPhotoUrl,
      String? petSpecies,
      String? petBreed});
}

/// @nodoc
class __$$AppointmentEntityImplCopyWithImpl<$Res>
    extends _$AppointmentEntityCopyWithImpl<$Res, _$AppointmentEntityImpl>
    implements _$$AppointmentEntityImplCopyWith<$Res> {
  __$$AppointmentEntityImplCopyWithImpl(_$AppointmentEntityImpl _value,
      $Res Function(_$AppointmentEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ownerId = null,
    Object? vetId = null,
    Object? petId = freezed,
    Object? petName = null,
    Object? dateTime = null,
    Object? status = null,
    Object? type = null,
    Object? notes = freezed,
    Object? price = null,
    Object? vetName = freezed,
    Object? ownerName = freezed,
    Object? petPhotoUrl = freezed,
    Object? petSpecies = freezed,
    Object? petBreed = freezed,
  }) {
    return _then(_$AppointmentEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      vetId: null == vetId
          ? _value.vetId
          : vetId // ignore: cast_nullable_to_non_nullable
              as String,
      petId: freezed == petId
          ? _value.petId
          : petId // ignore: cast_nullable_to_non_nullable
              as String?,
      petName: null == petName
          ? _value.petName
          : petName // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AppointmentStatus,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AppointmentType,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      vetName: freezed == vetName
          ? _value.vetName
          : vetName // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerName: freezed == ownerName
          ? _value.ownerName
          : ownerName // ignore: cast_nullable_to_non_nullable
              as String?,
      petPhotoUrl: freezed == petPhotoUrl
          ? _value.petPhotoUrl
          : petPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      petSpecies: freezed == petSpecies
          ? _value.petSpecies
          : petSpecies // ignore: cast_nullable_to_non_nullable
              as String?,
      petBreed: freezed == petBreed
          ? _value.petBreed
          : petBreed // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppointmentEntityImpl implements _AppointmentEntity {
  const _$AppointmentEntityImpl(
      {required this.id,
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
      this.petBreed});

  factory _$AppointmentEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppointmentEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String ownerId;
  @override
  final String vetId;
  @override
  final String? petId;
  @override
  final String petName;
  @override
  final DateTime dateTime;
  @override
  final AppointmentStatus status;
  @override
  final AppointmentType type;
  @override
  final String? notes;
  @override
  final double price;
  @override
  final String? vetName;
  @override
  final String? ownerName;
  @override
  final String? petPhotoUrl;
  @override
  final String? petSpecies;
  @override
  final String? petBreed;

  @override
  String toString() {
    return 'AppointmentEntity(id: $id, ownerId: $ownerId, vetId: $vetId, petId: $petId, petName: $petName, dateTime: $dateTime, status: $status, type: $type, notes: $notes, price: $price, vetName: $vetName, ownerName: $ownerName, petPhotoUrl: $petPhotoUrl, petSpecies: $petSpecies, petBreed: $petBreed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppointmentEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.vetId, vetId) || other.vetId == vetId) &&
            (identical(other.petId, petId) || other.petId == petId) &&
            (identical(other.petName, petName) || other.petName == petName) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.vetName, vetName) || other.vetName == vetName) &&
            (identical(other.ownerName, ownerName) ||
                other.ownerName == ownerName) &&
            (identical(other.petPhotoUrl, petPhotoUrl) ||
                other.petPhotoUrl == petPhotoUrl) &&
            (identical(other.petSpecies, petSpecies) ||
                other.petSpecies == petSpecies) &&
            (identical(other.petBreed, petBreed) ||
                other.petBreed == petBreed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      ownerId,
      vetId,
      petId,
      petName,
      dateTime,
      status,
      type,
      notes,
      price,
      vetName,
      ownerName,
      petPhotoUrl,
      petSpecies,
      petBreed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppointmentEntityImplCopyWith<_$AppointmentEntityImpl> get copyWith =>
      __$$AppointmentEntityImplCopyWithImpl<_$AppointmentEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppointmentEntityImplToJson(
      this,
    );
  }
}

abstract class _AppointmentEntity implements AppointmentEntity {
  const factory _AppointmentEntity(
      {required final String id,
      required final String ownerId,
      required final String vetId,
      final String? petId,
      required final String petName,
      required final DateTime dateTime,
      required final AppointmentStatus status,
      required final AppointmentType type,
      final String? notes,
      required final double price,
      final String? vetName,
      final String? ownerName,
      final String? petPhotoUrl,
      final String? petSpecies,
      final String? petBreed}) = _$AppointmentEntityImpl;

  factory _AppointmentEntity.fromJson(Map<String, dynamic> json) =
      _$AppointmentEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get ownerId;
  @override
  String get vetId;
  @override
  String? get petId;
  @override
  String get petName;
  @override
  DateTime get dateTime;
  @override
  AppointmentStatus get status;
  @override
  AppointmentType get type;
  @override
  String? get notes;
  @override
  double get price;
  @override
  String? get vetName;
  @override
  String? get ownerName;
  @override
  String? get petPhotoUrl;
  @override
  String? get petSpecies;
  @override
  String? get petBreed;
  @override
  @JsonKey(ignore: true)
  _$$AppointmentEntityImplCopyWith<_$AppointmentEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
