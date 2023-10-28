// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'precipitation_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrecipitationResponseModel _$PrecipitationResponseModelFromJson(
        Map<String, dynamic> json) =>
    PrecipitationResponseModel(
      hourly: json['hourly'] == null
          ? null
          : Hourly.fromJson(json['hourly'] as Map<String, dynamic>),
      daily: json['daily'] == null
          ? null
          : Daily.fromJson(json['daily'] as Map<String, dynamic>),
    );

Hourly _$HourlyFromJson(Map<String, dynamic> json) => Hourly(
      time: (json['time'] as List<dynamic>?)?.map((e) => e as String).toList(),
      precipitationProbability:
          (json['precipitationProbability'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList(),
    );

Daily _$DailyFromJson(Map<String, dynamic> json) => Daily(
      time: (json['time'] as List<dynamic>?)?.map((e) => e as String).toList(),
      temperature2mMax: (json['temperature2mMax'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      temperature2mMin: (json['temperature2mMin'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
    );
