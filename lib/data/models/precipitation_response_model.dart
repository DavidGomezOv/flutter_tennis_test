import 'package:json_annotation/json_annotation.dart';

part 'precipitation_response_model.g.dart';

@JsonSerializable(createToJson: false)
class PrecipitationResponseModel {
  Hourly hourly;
  Daily daily;

  PrecipitationResponseModel({
    required this.hourly,
    required this.daily,
  });

  factory PrecipitationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PrecipitationResponseModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class Hourly {
  List<String> time;
  @JsonKey(name: 'precipitation_probability')
  List<int> precipitationProbability;

  Hourly({
    required this.time,
    required this.precipitationProbability,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) => _$HourlyFromJson(json);
}

@JsonSerializable(createToJson: false)
class Daily {
  List<String> time;
  @JsonKey(name: 'apparent_temperature_max')
  List<double> apparentTemperatureMax;
  @JsonKey(name: 'apparent_temperature_min')
  List<double> apparentTemperatureMin;

  Daily({
    required this.time,
    required this.apparentTemperatureMax,
    required this.apparentTemperatureMin,
  });

  factory Daily.fromJson(Map<String, dynamic> json) => _$DailyFromJson(json);
}
