// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vet_statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VetStatisticsImpl _$$VetStatisticsImplFromJson(Map<String, dynamic> json) =>
    _$VetStatisticsImpl(
      todayAppointments: (json['todayAppointments'] as num).toInt(),
      weeklyRevenue: (json['weeklyRevenue'] as num).toDouble(),
      revenueByType: (json['revenueByType'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            $enumDecode(_$AppointmentTypeEnumMap, k), (e as num).toDouble()),
      ),
      dailyRevenue: (json['dailyRevenue'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      monthlyRevenue: (json['monthlyRevenue'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$$VetStatisticsImplToJson(_$VetStatisticsImpl instance) =>
    <String, dynamic>{
      'todayAppointments': instance.todayAppointments,
      'weeklyRevenue': instance.weeklyRevenue,
      'revenueByType': instance.revenueByType
          .map((k, e) => MapEntry(_$AppointmentTypeEnumMap[k]!, e)),
      'dailyRevenue': instance.dailyRevenue,
      'monthlyRevenue': instance.monthlyRevenue,
    };

const _$AppointmentTypeEnumMap = {
  AppointmentType.consultation: 'consultation',
  AppointmentType.vaccine: 'vaccine',
  AppointmentType.exam: 'exam',
  AppointmentType.surgery: 'surgery',
};
