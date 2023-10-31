import 'package:flutter_tennis_test/domain/repositories/reservations_repository.dart';
import 'package:flutter_tennis_test/domain/repositories/weather_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockReservationsRepository extends Mock
    implements ReservationsRepository {}

class MockWeatherRepository extends Mock implements WeatherRepository {}
