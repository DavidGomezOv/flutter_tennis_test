import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tennis_test/domain/models/reservation/reservation_model.dart';
import 'package:flutter_tennis_test/domain/repositories/reservations_repository.dart';
import 'package:flutter_tennis_test/presentation/pages/reservations/bloc/reservations_bloc.dart';
import 'package:flutter_tennis_test/presentation/pages/reservations/reservations_page.dart';
import 'package:flutter_tennis_test/presentation/pages/reservations/widgets/reservation_list_item.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../../mock_bloc_providers.dart';
import '../../../mock_data.dart';
import '../../../mock_repository_providers.dart';

void main() {
  late MockReservationsBloc mockReservationsBloc;
  late MockReservationsRepository mockReservationsRepository;

  setUpAll(() {
    mockReservationsRepository = MockReservationsRepository();
    mockReservationsBloc = MockReservationsBloc();
  });

  Widget widgetUnderTesting() => RepositoryProvider<ReservationsRepository>(
        create: (context) => mockReservationsRepository,
        child: Builder(builder: (context) {
          return const MaterialApp(home: ReservationsPage());
        }),
      );

  void stubData(List<ReservationModel> reservations) {
    when(() => mockReservationsRepository.getReservations())
        .thenAnswer((invocation) async => reservations);
    when(() => mockReservationsBloc.state)
        .thenReturn(SuccessState(reservations: reservations));
  }

  testWidgets(
      'Reservations page should show a CircularProgressIndicator when data is loading',
      (widgetTester) async {
    await widgetTester.binding.setSurfaceSize(const Size(300, 900));

    stubData(mockReservationsList);

    mockNetworkImagesFor(() async {
      await widgetTester.pumpWidget(widgetUnderTesting());
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await widgetTester.pump(const Duration(seconds: 1));
      expect(find.byType(ListView), findsOneWidget);
    });
  });

  testWidgets(
      'Reservations page should show a ListView when data is successfully returned',
      (widgetTester) async {
    await widgetTester.binding.setSurfaceSize(const Size(300, 900));

    stubData(mockReservationsList);

    mockNetworkImagesFor(() async {
      await widgetTester.pumpWidget(widgetUnderTesting());
      await widgetTester.pump(const Duration(seconds: 1));
      expect(find.byType(ListView), findsOneWidget);
    });
  });

  testWidgets(
      'Reservations page should show a Text with error message when data is empty',
      (widgetTester) async {
    await widgetTester.binding.setSurfaceSize(const Size(300, 900));

    stubData([]);

    mockNetworkImagesFor(() async {
      await widgetTester.pumpWidget(widgetUnderTesting());
      await widgetTester.pump(const Duration(seconds: 1));
      expect(find.text('There are no reservations for now'), findsOneWidget);
    });
  });

  testWidgets(
      'Reservations page should show a Text with error message when data is empty',
      (widgetTester) async {
    await widgetTester.binding.setSurfaceSize(const Size(300, 900));

    stubData(mockReservationsList);

    mockNetworkImagesFor(() async {
      await widgetTester.pumpWidget(widgetUnderTesting());
      await widgetTester.pump(const Duration(seconds: 1));
      await widgetTester.tap(find.byType(ReservationListItem).first);
      await widgetTester.pump(const Duration(seconds: 1));
      expect(find.text('Reservation Details'), findsOneWidget);
    });
  });
}
