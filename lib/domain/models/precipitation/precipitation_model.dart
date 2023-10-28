class PrecipitationModel {
  List<HourlyData>? hourlyData;
  List<DailyData>? dailyData;

  PrecipitationModel({
    this.hourlyData,
    this.dailyData,
  });
}

class HourlyData {
  final String time;
  final int precipitationProbability;

  HourlyData({
    required this.time,
    required this.precipitationProbability,
  });
}

class DailyData {
  final String time;
  final double maxTemperature;
  final double minTemperature;

  DailyData({
    required this.time,
    required this.maxTemperature,
    required this.minTemperature,
  });
}
