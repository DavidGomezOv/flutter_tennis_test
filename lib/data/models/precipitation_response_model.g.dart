// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'precipitation_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrecipitationResponseModel _$PrecipitationResponseModelFromJson(
        Map<String, dynamic> json) =>
    PrecipitationResponseModel(
      hourly: Hourly.fromJson(json['hourly'] as Map<String, dynamic>),
      daily: Daily.fromJson(json['daily'] as Map<String, dynamic>),
    );

Hourly _$HourlyFromJson(Map<String, dynamic> json) => Hourly(
      time: (json['time'] as List<dynamic>).map((e) => e as String).toList(),
      precipitationProbability:
          (json['precipitation_probability'] as List<dynamic>)
              .map((e) => e as int)
              .toList(),
    );

Daily _$DailyFromJson(Map<String, dynamic> json) => Daily(
      time: (json['time'] as List<dynamic>).map((e) => e as String).toList(),
      apparentTemperatureMax:
          (json['apparent_temperature_max'] as List<dynamic>)
              .map((e) => (e as num).toDouble())
              .toList(),
      apparentTemperatureMin:
          (json['apparent_temperature_min'] as List<dynamic>)
              .map((e) => (e as num).toDouble())
              .toList(),
    );
