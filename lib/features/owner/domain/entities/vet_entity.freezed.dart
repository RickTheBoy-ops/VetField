// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vet_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VetEntity _$VetEntityFromJson(Map<String, dynamic> json) {
  return _VetEntity.fromJson(json);
}

/// @nodoc
mixin _$VetEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get specialty => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  String get avatarUrl => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  bool get isAvailable => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VetEntityCopyWith<VetEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VetEntityCopyWith<$Res> {
  factory $VetEntityCopyWith(VetEntity value, $Res Function(VetEntity) then) =
      _$VetEntityCopyWithImpl<$Res, VetEntity>;
  @useResult
  $Res call(
      {String id,
      String name,
      String specialty,
      String address,
      double rating,
      double latitude,
      double longitude,
      String avatarUrl,
      double price,
      bool isAvailable});
}

/// @nodoc
class _$VetEntityCopyWithImpl<$Res, $Val extends VetEntity>
    implements $VetEntityCopyWith<$Res> {
  _$VetEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? specialty = null,
    Object? address = null,
    Object? rating = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? avatarUrl = null,
    Object? price = null,
    Object? isAvailable = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      specialty: null == specialty
          ? _value.specialty
          : specialty // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VetEntityImplCopyWith<$Res>
    implements $VetEntityCopyWith<$Res> {
  factory _$$VetEntityImplCopyWith(
          _$VetEntityImpl value, $Res Function(_$VetEntityImpl) then) =
      __$$VetEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String specialty,
      String address,
      double rating,
      double latitude,
      double longitude,
      String avatarUrl,
      double price,
      bool isAvailable});
}

/// @nodoc
class __$$VetEntityImplCopyWithImpl<$Res>
    extends _$VetEntityCopyWithImpl<$Res, _$VetEntityImpl>
    implements _$$VetEntityImplCopyWith<$Res> {
  __$$VetEntityImplCopyWithImpl(
      _$VetEntityImpl _value, $Res Function(_$VetEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? specialty = null,
    Object? address = null,
    Object? rating = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? avatarUrl = null,
    Object? price = null,
    Object? isAvailable = null,
  }) {
    return _then(_$VetEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      specialty: null == specialty
          ? _value.specialty
          : specialty // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VetEntityImpl implements _VetEntity {
  const _$VetEntityImpl(
      {required this.id,
      required this.name,
      required this.specialty,
      required this.address,
      required this.rating,
      required this.latitude,
      required this.longitude,
      required this.avatarUrl,
      required this.price,
      this.isAvailable = true});

  factory _$VetEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$VetEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String specialty;
  @override
  final String address;
  @override
  final double rating;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final String avatarUrl;
  @override
  final double price;
  @override
  @JsonKey()
  final bool isAvailable;

  @override
  String toString() {
    return 'VetEntity(id: $id, name: $name, specialty: $specialty, address: $address, rating: $rating, latitude: $latitude, longitude: $longitude, avatarUrl: $avatarUrl, price: $price, isAvailable: $isAvailable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VetEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.specialty, specialty) ||
                other.specialty == specialty) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, specialty, address,
      rating, latitude, longitude, avatarUrl, price, isAvailable);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VetEntityImplCopyWith<_$VetEntityImpl> get copyWith =>
      __$$VetEntityImplCopyWithImpl<_$VetEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VetEntityImplToJson(
      this,
    );
  }
}

abstract class _VetEntity implements VetEntity {
  const factory _VetEntity(
      {required final String id,
      required final String name,
      required final String specialty,
      required final String address,
      required final double rating,
      required final double latitude,
      required final double longitude,
      required final String avatarUrl,
      required final double price,
      final bool isAvailable}) = _$VetEntityImpl;

  factory _VetEntity.fromJson(Map<String, dynamic> json) =
      _$VetEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get specialty;
  @override
  String get address;
  @override
  double get rating;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  String get avatarUrl;
  @override
  double get price;
  @override
  bool get isAvailable;
  @override
  @JsonKey(ignore: true)
  _$$VetEntityImplCopyWith<_$VetEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
