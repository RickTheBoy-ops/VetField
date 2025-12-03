// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pet_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PetEntity {
  String get id => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get breed => throw _privateConstructorUsedError;
  PetSpecies get species => throw _privateConstructorUsedError;
  PetGender? get gender => throw _privateConstructorUsedError;
  DateTime? get birthDate => throw _privateConstructorUsedError;
  double? get weight => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PetEntityCopyWith<PetEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PetEntityCopyWith<$Res> {
  factory $PetEntityCopyWith(PetEntity value, $Res Function(PetEntity) then) =
      _$PetEntityCopyWithImpl<$Res, PetEntity>;
  @useResult
  $Res call(
      {String id,
      String ownerId,
      String name,
      String? breed,
      PetSpecies species,
      PetGender? gender,
      DateTime? birthDate,
      double? weight,
      String? photoUrl});
}

/// @nodoc
class _$PetEntityCopyWithImpl<$Res, $Val extends PetEntity>
    implements $PetEntityCopyWith<$Res> {
  _$PetEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ownerId = null,
    Object? name = null,
    Object? breed = freezed,
    Object? species = null,
    Object? gender = freezed,
    Object? birthDate = freezed,
    Object? weight = freezed,
    Object? photoUrl = freezed,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      breed: freezed == breed
          ? _value.breed
          : breed // ignore: cast_nullable_to_non_nullable
              as String?,
      species: null == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as PetSpecies,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as PetGender?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PetEntityImplCopyWith<$Res>
    implements $PetEntityCopyWith<$Res> {
  factory _$$PetEntityImplCopyWith(
          _$PetEntityImpl value, $Res Function(_$PetEntityImpl) then) =
      __$$PetEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String ownerId,
      String name,
      String? breed,
      PetSpecies species,
      PetGender? gender,
      DateTime? birthDate,
      double? weight,
      String? photoUrl});
}

/// @nodoc
class __$$PetEntityImplCopyWithImpl<$Res>
    extends _$PetEntityCopyWithImpl<$Res, _$PetEntityImpl>
    implements _$$PetEntityImplCopyWith<$Res> {
  __$$PetEntityImplCopyWithImpl(
      _$PetEntityImpl _value, $Res Function(_$PetEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ownerId = null,
    Object? name = null,
    Object? breed = freezed,
    Object? species = null,
    Object? gender = freezed,
    Object? birthDate = freezed,
    Object? weight = freezed,
    Object? photoUrl = freezed,
  }) {
    return _then(_$PetEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      breed: freezed == breed
          ? _value.breed
          : breed // ignore: cast_nullable_to_non_nullable
              as String?,
      species: null == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as PetSpecies,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as PetGender?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PetEntityImpl implements _PetEntity {
  const _$PetEntityImpl(
      {required this.id,
      required this.ownerId,
      required this.name,
      this.breed,
      required this.species,
      this.gender,
      this.birthDate,
      this.weight,
      this.photoUrl});

  @override
  final String id;
  @override
  final String ownerId;
  @override
  final String name;
  @override
  final String? breed;
  @override
  final PetSpecies species;
  @override
  final PetGender? gender;
  @override
  final DateTime? birthDate;
  @override
  final double? weight;
  @override
  final String? photoUrl;

  @override
  String toString() {
    return 'PetEntity(id: $id, ownerId: $ownerId, name: $name, breed: $breed, species: $species, gender: $gender, birthDate: $birthDate, weight: $weight, photoUrl: $photoUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PetEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.breed, breed) || other.breed == breed) &&
            (identical(other.species, species) || other.species == species) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, ownerId, name, breed,
      species, gender, birthDate, weight, photoUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PetEntityImplCopyWith<_$PetEntityImpl> get copyWith =>
      __$$PetEntityImplCopyWithImpl<_$PetEntityImpl>(this, _$identity);
}

abstract class _PetEntity implements PetEntity {
  const factory _PetEntity(
      {required final String id,
      required final String ownerId,
      required final String name,
      final String? breed,
      required final PetSpecies species,
      final PetGender? gender,
      final DateTime? birthDate,
      final double? weight,
      final String? photoUrl}) = _$PetEntityImpl;

  @override
  String get id;
  @override
  String get ownerId;
  @override
  String get name;
  @override
  String? get breed;
  @override
  PetSpecies get species;
  @override
  PetGender? get gender;
  @override
  DateTime? get birthDate;
  @override
  double? get weight;
  @override
  String? get photoUrl;
  @override
  @JsonKey(ignore: true)
  _$$PetEntityImplCopyWith<_$PetEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
