// Mocks generated by Mockito 5.4.2 from annotations
// in flutter_tennis_test/test/data/repositories/weather_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:flutter_tennis_test/data/datasources/remote/weather_data_api.dart'
    as _i3;
import 'package:flutter_tennis_test/data/models/precipitation_response_model.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakePrecipitationResponseModel_0 extends _i1.SmartFake
    implements _i2.PrecipitationResponseModel {
  _FakePrecipitationResponseModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [WeatherDataApi].
///
/// See the documentation for Mockito's code generation for more information.
class MockWeatherDataApi extends _i1.Mock implements _i3.WeatherDataApi {
  MockWeatherDataApi() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get baseUrl => (super.noSuchMethod(
        Invocation.getter(#baseUrl),
        returnValue: '',
      ) as String);

  @override
  String get basePath => (super.noSuchMethod(
        Invocation.getter(#basePath),
        returnValue: '',
      ) as String);

  @override
  _i4.Future<_i2.PrecipitationResponseModel> getWeatherData({
    required double? lat,
    required double? lng,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getWeatherData,
          [],
          {
            #lat: lat,
            #lng: lng,
          },
        ),
        returnValue: _i4.Future<_i2.PrecipitationResponseModel>.value(
            _FakePrecipitationResponseModel_0(
          this,
          Invocation.method(
            #getWeatherData,
            [],
            {
              #lat: lat,
              #lng: lng,
            },
          ),
        )),
      ) as _i4.Future<_i2.PrecipitationResponseModel>);
}
