// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pet_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PetModel _$PetModelFromJson(Map<String, dynamic> json) {
  return _PetModel.fromJson(json);
}

/// @nodoc
mixin _$PetModel {
  String get id => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get breed => throw _privateConstructorUsedError;
  PetSpecies get species => throw _privateConstructorUsedError;
  PetGender? get gender => throw _privateConstructorUsedError;
  DateTime? get birthDate => throw _privateConstructorUsedError;
  double? get weight => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;

  /// Serializes this PetModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PetModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PetModelCopyWith<PetModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PetModelCopyWith<$Res> {
  factory $PetModelCopyWith(PetModel value, $Res Function(PetModel) then) =
      _$PetModelCopyWithImpl<$Res, PetModel>;
  @useResult
  $Res call({
    String id,
    String ownerId,
    String name,
    String? breed,
    PetSpecies species,
    PetGender? gender,
    DateTime? birthDate,
    double? weight,
    String? photoUrl,
  });
}

/// @nodoc
class _$PetModelCopyWithImpl<$Res, $Val extends PetModel>
    implements $PetModelCopyWith<$Res> {
  _$PetModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PetModel
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(
      _value.copyWith(
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PetModelImplCopyWith<$Res>
    implements $PetModelCopyWith<$Res> {
  factory _$$PetModelImplCopyWith(
    _$PetModelImpl value,
    $Res Function(_$PetModelImpl) then,
  ) = __$$PetModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String ownerId,
    String name,
    String? breed,
    PetSpecies species,
    PetGender? gender,
    DateTime? birthDate,
    double? weight,
    String? photoUrl,
  });
}

/// @nodoc
class __$$PetModelImplCopyWithImpl<$Res>
    extends _$PetModelCopyWithImpl<$Res, _$PetModelImpl>
    implements _$$PetModelImplCopyWith<$Res> {
  __$$PetModelImplCopyWithImpl(
    _$PetModelImpl _value,
    $Res Function(_$PetModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PetModel
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(
      _$PetModelImpl(
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PetModelImpl extends _PetModel {
  const _$PetModelImpl({
    required this.id,
    required this.ownerId,
    required this.name,
    this.breed,
    required this.species,
    this.gender,
    this.birthDate,
    this.weight,
    this.photoUrl,
  }) : super._();

  factory _$PetModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PetModelImplFromJson(json);

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
    return 'PetModel(id: $id, ownerId: $ownerId, name: $name, breed: $breed, species: $species, gender: $gender, birthDate: $birthDate, weight: $weight, photoUrl: $photoUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PetModelImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    ownerId,
    name,
    breed,
    species,
    gender,
    birthDate,
    weight,
    photoUrl,
  );

  /// Create a copy of PetModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PetModelImplCopyWith<_$PetModelImpl> get copyWith =>
      __$$PetModelImplCopyWithImpl<_$PetModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PetModelImplToJson(this);
  }
}

abstract class _PetModel extends PetModel {
  const factory _PetModel({
    required final String id,
    required final String ownerId,
    required final String name,
    final String? breed,
    required final PetSpecies species,
    final PetGender? gender,
    final DateTime? birthDate,
    final double? weight,
    final String? photoUrl,
  }) = _$PetModelImpl;
  const _PetModel._() : super._();

  factory _PetModel.fromJson(Map<String, dynamic> json) =
      _$PetModelImpl.fromJson;

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

  /// Create a copy of PetModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PetModelImplCopyWith<_$PetModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
