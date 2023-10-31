import 'package:flutter_tennis_test/data/datasources/remote/precipitation_data_api.dart';
import 'package:flutter_tennis_test/data/models/precipitation_response_model.dart';
import 'package:flutter_tennis_test/domain/models/precipitation/precipitation_model.dart';
import 'package:flutter_tennis_test/domain/repositories/precipitation_repository.dart';

class PrecipitationRepositoryImpl implements PrecipitationRepository {
  final PrecipitationDataApi precipitationDataApi;

  PrecipitationRepositoryImpl({required this.precipitationDataApi});

  @override
  Future<WeatherModel> getWeatherData({
    required double lat,
    required double lng,
  }) async {
    final result =
        await precipitationDataApi.getWeatherData(lat: lat, lng: lng);
    return WeatherModel(
      hourlyData: _mapHourlyData(result.hourly),
      dailyData: _mapDailyData(result.daily),
    );
  }

  List<HourlyData> _mapHourlyData(Hourly hourly) {
    List<HourlyData> hourlyData = [];
    for (int i = 0; i < hourly.time.length; i++) {
      hourlyData.add(HourlyData(
        time: hourly.time[i],
        precipitationProbability: hourly.precipitationProbability[i],
      ));
    }
    return hourlyData;
  }

  List<DailyData> _mapDailyData(Daily daily) {
    List<DailyData> dailyData = [];
    for (int i = 0; i < daily.time.length; i++) {
      dailyData.add(DailyData(
        time: daily.time[i],
        maxTemperature: daily.apparentTemperatureMax[i],
        minTemperature: daily.apparentTemperatureMin[i],
      ));
    }
    return dailyData;
  }
}
