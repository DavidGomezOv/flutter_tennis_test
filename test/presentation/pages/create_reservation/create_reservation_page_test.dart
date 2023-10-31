import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tennis_test/domain/repositories/reservations_repository.dart';
import 'package:flutter_tennis_test/domain/repositories/weather_repository.dart';
import 'package:flutter_tennis_test/presentation/pages/create_reservation/bloc/create_reservation_bloc.dart';
import 'package:flutter_tennis_test/presentation/pages/create_reservation/create_reservation_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../../mock_bloc_providers.dart';
import '../../../mock_data.dart';
import '../../../mock_repository_providers.dart';

void main() {
  late MockCreateReservationBloc mockCreateReservationBloc;
  late MockReservationsRepository mockReservationsRepository;
  late MockWeatherRepository mockWeatherRepository;

  setUpAll(() {
    mockReservationsRepository = MockReservationsRepository();
    mockWeatherRepository = MockWeatherRepository();
    mockCreateReservationBloc = MockCreateReservationBloc();
  });

  Widget widgetUnderTesting() => MultiRepositoryProvider(
          providers: [
            RepositoryProvider<ReservationsRepository>(
              create: (context) => mockReservationsRepository,
            ),
            RepositoryProvider<WeatherRepository>(
              create: (context) => mockWeatherRepository,
            ),
          ],
          child: Builder(builder: (context) {
            return const MaterialApp(home: CreateReservationPage());
          }));

  void stubData() {
    when(() => mockReservationsRepository.getCourts())
        .thenAnswer((invocation) async => mockCourtList);
    when(() => mockCreateReservationBloc.state)
        .thenReturn(LoadedCourtsState(courts: mockCourtList));
  }

  testWidgets(
      'CreateReservations page should show a CircularProgressIndicator when data is loading',
      (widgetTester) async {
    await widgetTester.binding.setSurfaceSize(const Size(500, 900));

    stubData();

    mockNetworkImagesFor(() async {
      await widgetTester.pumpWidget(widgetUnderTesting());
      await widgetTester.pump(const Duration(seconds: 1));
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });


}
