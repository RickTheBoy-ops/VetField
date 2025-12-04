// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social_pet_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SocialPet _$SocialPetFromJson(Map<String, dynamic> json) {
  return _SocialPet.fromJson(json);
}

/// @nodoc
mixin _$SocialPet {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get breed => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  double? get distanceKm => throw _privateConstructorUsedError;
  bool get isOnline => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;
  String? get ownerName => throw _privateConstructorUsedError;
  String? get checkInMessage => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  LatLng? get location => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SocialPetCopyWith<SocialPet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocialPetCopyWith<$Res> {
  factory $SocialPetCopyWith(SocialPet value, $Res Function(SocialPet) then) =
      _$SocialPetCopyWithImpl<$Res, SocialPet>;
  @useResult
  $Res call(
      {String id,
      String name,
      String breed,
      String? photoUrl,
      double? distanceKm,
      bool isOnline,
      String ownerId,
      String? ownerName,
      String? checkInMessage,
      @JsonKey(includeFromJson: false, includeToJson: false) LatLng? location});
}

/// @nodoc
class _$SocialPetCopyWithImpl<$Res, $Val extends SocialPet>
    implements $SocialPetCopyWith<$Res> {
  _$SocialPetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? breed = null,
    Object? photoUrl = freezed,
    Object? distanceKm = freezed,
    Object? isOnline = null,
    Object? ownerId = null,
    Object? ownerName = freezed,
    Object? checkInMessage = freezed,
    Object? location = freezed,
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
      breed: null == breed
          ? _value.breed
          : breed // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      distanceKm: freezed == distanceKm
          ? _value.distanceKm
          : distanceKm // ignore: cast_nullable_to_non_nullable
              as double?,
      isOnline: null == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      ownerName: freezed == ownerName
          ? _value.ownerName
          : ownerName // ignore: cast_nullable_to_non_nullable
              as String?,
      checkInMessage: freezed == checkInMessage
          ? _value.checkInMessage
          : checkInMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LatLng?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SocialPetImplCopyWith<$Res>
    implements $SocialPetCopyWith<$Res> {
  factory _$$SocialPetImplCopyWith(
          _$SocialPetImpl value, $Res Function(_$SocialPetImpl) then) =
      __$$SocialPetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String breed,
      String? photoUrl,
      double? distanceKm,
      bool isOnline,
      String ownerId,
      String? ownerName,
      String? checkInMessage,
      @JsonKey(includeFromJson: false, includeToJson: false) LatLng? location});
}

/// @nodoc
class __$$SocialPetImplCopyWithImpl<$Res>
    extends _$SocialPetCopyWithImpl<$Res, _$SocialPetImpl>
    implements _$$SocialPetImplCopyWith<$Res> {
  __$$SocialPetImplCopyWithImpl(
      _$SocialPetImpl _value, $Res Function(_$SocialPetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? breed = null,
    Object? photoUrl = freezed,
    Object? distanceKm = freezed,
    Object? isOnline = null,
    Object? ownerId = null,
    Object? ownerName = freezed,
    Object? checkInMessage = freezed,
    Object? location = freezed,
  }) {
    return _then(_$SocialPetImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      breed: null == breed
          ? _value.breed
          : breed // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      distanceKm: freezed == distanceKm
          ? _value.distanceKm
          : distanceKm // ignore: cast_nullable_to_non_nullable
              as double?,
      isOnline: null == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      ownerName: freezed == ownerName
          ? _value.ownerName
          : ownerName // ignore: cast_nullable_to_non_nullable
              as String?,
      checkInMessage: freezed == checkInMessage
          ? _value.checkInMessage
          : checkInMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LatLng?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SocialPetImpl implements _SocialPet {
  const _$SocialPetImpl(
      {required this.id,
      required this.name,
      required this.breed,
      this.photoUrl,
      this.distanceKm,
      required this.isOnline,
      required this.ownerId,
      this.ownerName,
      this.checkInMessage,
      @JsonKey(includeFromJson: false, includeToJson: false) this.location});

  factory _$SocialPetImpl.fromJson(Map<String, dynamic> json) =>
      _$$SocialPetImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String breed;
  @override
  final String? photoUrl;
  @override
  final double? distanceKm;
  @override
  final bool isOnline;
  @override
  final String ownerId;
  @override
  final String? ownerName;
  @override
  final String? checkInMessage;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final LatLng? location;

  @override
  String toString() {
    return 'SocialPet(id: $id, name: $name, breed: $breed, photoUrl: $photoUrl, distanceKm: $distanceKm, isOnline: $isOnline, ownerId: $ownerId, ownerName: $ownerName, checkInMessage: $checkInMessage, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocialPetImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.breed, breed) || other.breed == breed) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.distanceKm, distanceKm) ||
                other.distanceKm == distanceKm) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.ownerName, ownerName) ||
                other.ownerName == ownerName) &&
            (identical(other.checkInMessage, checkInMessage) ||
                other.checkInMessage == checkInMessage) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, breed, photoUrl,
      distanceKm, isOnline, ownerId, ownerName, checkInMessage, location);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SocialPetImplCopyWith<_$SocialPetImpl> get copyWith =>
      __$$SocialPetImplCopyWithImpl<_$SocialPetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SocialPetImplToJson(
      this,
    );
  }
}

abstract class _SocialPet implements SocialPet {
  const factory _SocialPet(
      {required final String id,
      required final String name,
      required final String breed,
      final String? photoUrl,
      final double? distanceKm,
      required final bool isOnline,
      required final String ownerId,
      final String? ownerName,
      final String? checkInMessage,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final LatLng? location}) = _$SocialPetImpl;

  factory _SocialPet.fromJson(Map<String, dynamic> json) =
      _$SocialPetImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get breed;
  @override
  String? get photoUrl;
  @override
  double? get distanceKm;
  @override
  bool get isOnline;
  @override
  String get ownerId;
  @override
  String? get ownerName;
  @override
  String? get checkInMessage;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  LatLng? get location;
  @override
  @JsonKey(ignore: true)
  _$$SocialPetImplCopyWith<_$SocialPetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
