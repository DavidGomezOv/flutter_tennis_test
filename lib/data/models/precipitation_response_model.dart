import 'package:json_annotation/json_annotation.dart';

part 'precipitation_response_model.g.dart';

@JsonSerializable(createToJson: false)
class PrecipitationResponseModel {
  Hourly? hourly;
  Daily? daily;

  PrecipitationResponseModel({
    this.hourly,
    this.daily,
  });

  factory PrecipitationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PrecipitationResponseModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class Hourly {
  List<String>? time;
  List<int>? precipitationProbability;

  Hourly({
    this.time,
    this.precipitationProbability,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) => _$HourlyFromJson(json);
}

@JsonSerializable(createToJson: false)
class Daily {
  List<String>? time;
  List<double>? temperature2mMax;
  List<double>? temperature2mMin;

  Daily({
    this.time,
    this.temperature2mMax,
    this.temperature2mMin,
  });

  factory Daily.fromJson(Map<String, dynamic> json) => _$DailyFromJson(json);
}
