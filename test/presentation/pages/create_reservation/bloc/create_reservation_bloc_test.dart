import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_tennis_test/presentation/pages/create_reservation/bloc/create_reservation_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../mock_data.dart';
import '../../../../mock_repository_providers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockReservationsRepository mockReservationsRepository;
  late MockWeatherRepository mockWeatherRepository;
  late CreateReservationBloc createReservationBloc;

  setUp(() {
    mockReservationsRepository = MockReservationsRepository();
    mockWeatherRepository = MockWeatherRepository();
    createReservationBloc = CreateReservationBloc(
        reservationsRepository: mockReservationsRepository,
        weatherRepository: mockWeatherRepository);
  });

  group('CreateReservationBloc Tests', () {
    blocTest<CreateReservationBloc, CreateReservationState>(
      'emit [UpdateValuesState] when add an UpdateValuesEvent with correct data',
      build: () {
        return createReservationBloc;
      },
      act: (bloc) {
        bloc.add(UpdateValuesEvent(
          courtId: 1,
          courtName: 'courtName',
          courtImage: 'courtImage',
          reservationDate: DateTime(2023, 12, 12),
          reservationTime: 1,
          precipitationProbability: 1,
          maxTemp: 1,
          minTemp: 1,
        ));
      },
      expect: () => [
        UpdateValuesState(reservationModel: mockReservationModel),
      ],
    );
  });
}
