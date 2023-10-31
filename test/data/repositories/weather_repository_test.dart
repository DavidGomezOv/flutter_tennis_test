import 'package:flutter_tennis_test/data/datasources/remote/weather_data_api.dart';
import 'package:flutter_tennis_test/data/models/precipitation_response_model.dart';
import 'package:flutter_tennis_test/data/repositories_impl/weather_repository_impl.dart';
import 'package:flutter_tennis_test/domain/models/precipitation/precipitation_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../mock_data.dart';
import 'weather_repository_test.mocks.dart';

@GenerateMocks([WeatherDataApi])
void main() {
  final mockWeatherDataApi = MockWeatherDataApi();

  late WeatherRepositoryImpl repositoryUnderTesting;

  setUp(() {
    repositoryUnderTesting =
        WeatherRepositoryImpl(weatherDataApi: mockWeatherDataApi);
  });

  tearDown(() {
    clearInteractions(mockWeatherDataApi);
  });

  group('Weather Repository - Test suite for getWeatherData method', () {
    test(
        'Given successful datasource response should return a WeatherModel object',
        () async {
      when(mockWeatherDataApi.getWeatherData(lat: 1, lng: 1))
          .thenAnswer((realInvocation) async => mockPrecipitationModel);
      final result =
          await repositoryUnderTesting.getWeatherData(lat: 1, lng: 1);
      verify(mockWeatherDataApi.getWeatherData(lat: 1, lng: 1)).called(1);
      _verifyWeatherData(result, mockPrecipitationModel);
    });

    test(
        'Given a datasource Internet error should return an Exception with custom message',
        () async {
      final internetException = Exception('No internet connection');
      when(mockWeatherDataApi.getWeatherData(lat: 1, lng: 1))
          .thenThrow(internetException);
      try {
        await repositoryUnderTesting.getWeatherData(lat: 1, lng: 1);
      } catch (e) {
        verify(mockWeatherDataApi.getWeatherData(lat: 1, lng: 1)).called(1);
        expect(e, internetException);
      }
    });

    test('Given a datasource error should return an Exception object',
        () async {
      final error = Exception();
      when(mockWeatherDataApi.getWeatherData(lat: 1, lng: 1)).thenThrow(error);
      try {
        await repositoryUnderTesting.getWeatherData(lat: 1, lng: 1);
      } catch (e) {
        verify(mockWeatherDataApi.getWeatherData(lat: 1, lng: 1)).called(1);
        expect(e, error);
      }
    });
  });
}

void _verifyWeatherData(WeatherModel result,
    PrecipitationResponseModel precipitationResponseModel) {
  expect(result.hourlyData![0].time, precipitationResponseModel.hourly.time[0]);
  expect(result.hourlyData![0].precipitationProbability,
      precipitationResponseModel.hourly.precipitationProbability[0]);
  expect(result.dailyData![0].time, precipitationResponseModel.daily.time[0]);
  expect(result.dailyData![0].maxTemperature,
      precipitationResponseModel.daily.apparentTemperatureMax[0]);
  expect(result.dailyData![0].minTemperature,
      precipitationResponseModel.daily.apparentTemperatureMin[0]);
}
