import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_tennis_test/core/helpers/network_helper.dart';
import 'package:flutter_tennis_test/data/models/precipitation_response_model.dart';
import 'package:http/http.dart' as http;

class PrecipitationDataApi {
  final String baseUrl = 'api.open-meteo.com';
  final String basePath = '/v1/forecast';

  Future<PrecipitationResponseModel> getWeatherData({
    required double lat,
    required double lng,
  }) async {
    await NetworkHelper().validateConnection();
    final response = await http
        .get(_buildUrl(lat, lng))
        .timeout(const Duration(seconds: 30))
        .onError((error, _) => throw (error.toString()));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return PrecipitationResponseModel.fromJson(json);
    } else {
      throw ('Error! Status code: ${response.statusCode}');
    }
  }

  Uri _buildUrl(double lat, double lng) {
    return Uri.parse(
        'https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lng&hourly=precipitation_probability&daily=apparent_temperature_max,apparent_temperature_min&timezone=auto');
  }
}
