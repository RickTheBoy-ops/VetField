// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vet_statistics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VetStatistics _$VetStatisticsFromJson(Map<String, dynamic> json) {
  return _VetStatistics.fromJson(json);
}

/// @nodoc
mixin _$VetStatistics {
  int get todayAppointments => throw _privateConstructorUsedError;
  double get weeklyRevenue => throw _privateConstructorUsedError;
  Map<AppointmentType, double> get revenueByType =>
      throw _privateConstructorUsedError;
  List<double> get dailyRevenue => throw _privateConstructorUsedError;
  List<double> get monthlyRevenue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VetStatisticsCopyWith<VetStatistics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VetStatisticsCopyWith<$Res> {
  factory $VetStatisticsCopyWith(
          VetStatistics value, $Res Function(VetStatistics) then) =
      _$VetStatisticsCopyWithImpl<$Res, VetStatistics>;
  @useResult
  $Res call(
      {int todayAppointments,
      double weeklyRevenue,
      Map<AppointmentType, double> revenueByType,
      List<double> dailyRevenue,
      List<double> monthlyRevenue});
}

/// @nodoc
class _$VetStatisticsCopyWithImpl<$Res, $Val extends VetStatistics>
    implements $VetStatisticsCopyWith<$Res> {
  _$VetStatisticsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todayAppointments = null,
    Object? weeklyRevenue = null,
    Object? revenueByType = null,
    Object? dailyRevenue = null,
    Object? monthlyRevenue = null,
  }) {
    return _then(_value.copyWith(
      todayAppointments: null == todayAppointments
          ? _value.todayAppointments
          : todayAppointments // ignore: cast_nullable_to_non_nullable
              as int,
      weeklyRevenue: null == weeklyRevenue
          ? _value.weeklyRevenue
          : weeklyRevenue // ignore: cast_nullable_to_non_nullable
              as double,
      revenueByType: null == revenueByType
          ? _value.revenueByType
          : revenueByType // ignore: cast_nullable_to_non_nullable
              as Map<AppointmentType, double>,
      dailyRevenue: null == dailyRevenue
          ? _value.dailyRevenue
          : dailyRevenue // ignore: cast_nullable_to_non_nullable
              as List<double>,
      monthlyRevenue: null == monthlyRevenue
          ? _value.monthlyRevenue
          : monthlyRevenue // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VetStatisticsImplCopyWith<$Res>
    implements $VetStatisticsCopyWith<$Res> {
  factory _$$VetStatisticsImplCopyWith(
          _$VetStatisticsImpl value, $Res Function(_$VetStatisticsImpl) then) =
      __$$VetStatisticsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int todayAppointments,
      double weeklyRevenue,
      Map<AppointmentType, double> revenueByType,
      List<double> dailyRevenue,
      List<double> monthlyRevenue});
}

/// @nodoc
class __$$VetStatisticsImplCopyWithImpl<$Res>
    extends _$VetStatisticsCopyWithImpl<$Res, _$VetStatisticsImpl>
    implements _$$VetStatisticsImplCopyWith<$Res> {
  __$$VetStatisticsImplCopyWithImpl(
      _$VetStatisticsImpl _value, $Res Function(_$VetStatisticsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todayAppointments = null,
    Object? weeklyRevenue = null,
    Object? revenueByType = null,
    Object? dailyRevenue = null,
    Object? monthlyRevenue = null,
  }) {
    return _then(_$VetStatisticsImpl(
      todayAppointments: null == todayAppointments
          ? _value.todayAppointments
          : todayAppointments // ignore: cast_nullable_to_non_nullable
              as int,
      weeklyRevenue: null == weeklyRevenue
          ? _value.weeklyRevenue
          : weeklyRevenue // ignore: cast_nullable_to_non_nullable
              as double,
      revenueByType: null == revenueByType
          ? _value._revenueByType
          : revenueByType // ignore: cast_nullable_to_non_nullable
              as Map<AppointmentType, double>,
      dailyRevenue: null == dailyRevenue
          ? _value._dailyRevenue
          : dailyRevenue // ignore: cast_nullable_to_non_nullable
              as List<double>,
      monthlyRevenue: null == monthlyRevenue
          ? _value._monthlyRevenue
          : monthlyRevenue // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VetStatisticsImpl implements _VetStatistics {
  const _$VetStatisticsImpl(
      {required this.todayAppointments,
      required this.weeklyRevenue,
      required final Map<AppointmentType, double> revenueByType,
      required final List<double> dailyRevenue,
      required final List<double> monthlyRevenue})
      : _revenueByType = revenueByType,
        _dailyRevenue = dailyRevenue,
        _monthlyRevenue = monthlyRevenue;

  factory _$VetStatisticsImpl.fromJson(Map<String, dynamic> json) =>
      _$$VetStatisticsImplFromJson(json);

  @override
  final int todayAppointments;
  @override
  final double weeklyRevenue;
  final Map<AppointmentType, double> _revenueByType;
  @override
  Map<AppointmentType, double> get revenueByType {
    if (_revenueByType is EqualUnmodifiableMapView) return _revenueByType;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_revenueByType);
  }

  final List<double> _dailyRevenue;
  @override
  List<double> get dailyRevenue {
    if (_dailyRevenue is EqualUnmodifiableListView) return _dailyRevenue;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dailyRevenue);
  }

  final List<double> _monthlyRevenue;
  @override
  List<double> get monthlyRevenue {
    if (_monthlyRevenue is EqualUnmodifiableListView) return _monthlyRevenue;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_monthlyRevenue);
  }

  @override
  String toString() {
    return 'VetStatistics(todayAppointments: $todayAppointments, weeklyRevenue: $weeklyRevenue, revenueByType: $revenueByType, dailyRevenue: $dailyRevenue, monthlyRevenue: $monthlyRevenue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VetStatisticsImpl &&
            (identical(other.todayAppointments, todayAppointments) ||
                other.todayAppointments == todayAppointments) &&
            (identical(other.weeklyRevenue, weeklyRevenue) ||
                other.weeklyRevenue == weeklyRevenue) &&
            const DeepCollectionEquality()
                .equals(other._revenueByType, _revenueByType) &&
            const DeepCollectionEquality()
                .equals(other._dailyRevenue, _dailyRevenue) &&
            const DeepCollectionEquality()
                .equals(other._monthlyRevenue, _monthlyRevenue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      todayAppointments,
      weeklyRevenue,
      const DeepCollectionEquality().hash(_revenueByType),
      const DeepCollectionEquality().hash(_dailyRevenue),
      const DeepCollectionEquality().hash(_monthlyRevenue));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VetStatisticsImplCopyWith<_$VetStatisticsImpl> get copyWith =>
      __$$VetStatisticsImplCopyWithImpl<_$VetStatisticsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VetStatisticsImplToJson(
      this,
    );
  }
}

abstract class _VetStatistics implements VetStatistics {
  const factory _VetStatistics(
      {required final int todayAppointments,
      required final double weeklyRevenue,
      required final Map<AppointmentType, double> revenueByType,
      required final List<double> dailyRevenue,
      required final List<double> monthlyRevenue}) = _$VetStatisticsImpl;

  factory _VetStatistics.fromJson(Map<String, dynamic> json) =
      _$VetStatisticsImpl.fromJson;

  @override
  int get todayAppointments;
  @override
  double get weeklyRevenue;
  @override
  Map<AppointmentType, double> get revenueByType;
  @override
  List<double> get dailyRevenue;
  @override
  List<double> get monthlyRevenue;
  @override
  @JsonKey(ignore: true)
  _$$VetStatisticsImplCopyWith<_$VetStatisticsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
