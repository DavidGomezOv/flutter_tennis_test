import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_tennis_test/presentation/pages/reservations/bloc/reservations_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mock_data.dart';
import '../../../../mock_repository_providers.dart';

void main() {
  late MockReservationsRepository mockReservationsRepository;
  late ReservationsBloc reservationsBloc;

  setUp(() {
    mockReservationsRepository = MockReservationsRepository();
    reservationsBloc =
        ReservationsBloc(reservationsRepository: mockReservationsRepository);
  });

  group('ReservationsBloc Tests', () {
    blocTest<ReservationsBloc, ReservationsState>(
      'emit [LoadingState, SuccessState] when successfully fetch the reservations',
      build: () {
        when(() => mockReservationsRepository.getReservations())
            .thenAnswer((_) async => mockReservationsList);
        return reservationsBloc;
      },
      act: (bloc) => bloc.add(const FetchReservationsEvent()),
      expect: () => [
        const LoadingState(),
        SuccessState(reservations: mockReservationsList),
      ],
    );

    blocTest<ReservationsBloc, ReservationsState>(
      'emit [LoadingState, ErrorState] when fetch reservations returns empty',
      build: () {
        when(() => mockReservationsRepository.getReservations())
            .thenAnswer((_) async => []);
        return reservationsBloc;
      },
      act: (bloc) => bloc.add(const FetchReservationsEvent()),
      expect: () => [
        const LoadingState(),
        const ErrorState(errorMessage: 'There are no reservations for now'),
      ],
    );

    blocTest<ReservationsBloc, ReservationsState>(
      'emit [LoadingState, SuccessDeleteState] when delete a reservation',
      build: () {
        when(() =>
                mockReservationsRepository.deleteReservation(reservationId: 1))
            .thenAnswer((invocation) async => {});
        return reservationsBloc;
      },
      act: (bloc) => bloc.add(const DeleteReservationEvent(reservationId: 1)),
      expect: () => [
        const LoadingState(),
        const SuccessDeleteState(),
      ],
    );
  });
}
