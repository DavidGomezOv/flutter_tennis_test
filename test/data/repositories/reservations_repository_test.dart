import 'package:flutter_tennis_test/data/datasources/local/reservation_local_source.dart';
import 'package:flutter_tennis_test/data/repositories_impl/reservations_repository_impl.dart';
import 'package:flutter_tennis_test/domain/models/reservation/reservation_model.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mock_data.dart';
import 'reservations_repository_test.mocks.dart';

@GenerateMocks([ReservationLocalSource])
void main() {
  final mockReservationLocalSource = MockReservationLocalSource();

  late ReservationsRepositoryImpl repositoryUnderTesting;

  setUp(() {
    repositoryUnderTesting = ReservationsRepositoryImpl(
        reservationLocalSource: mockReservationLocalSource);
  });

  tearDown(() {
    clearInteractions(mockReservationLocalSource);
  });

  group('Reservations Repository - Test suite for getReservations method', () {
    test(
        'Given successful datasource response should return a List of ReservationModel',
        () async {
      when(mockReservationLocalSource.getReservations())
          .thenAnswer((realInvocation) async => mockReservationsList);
      final result = await repositoryUnderTesting.getReservations();
      verify(mockReservationLocalSource.getReservations()).called(1);
      expect(result, mockReservationsList);
    });

    test('Given a datasource error should return an Exception object',
        () async {
      final error = Exception();
      when(mockReservationLocalSource.getReservations()).thenThrow(error);
      try {
        await repositoryUnderTesting.getReservations();
      } catch (e) {
        verify(mockReservationLocalSource.getReservations()).called(1);
        expect(e, error);
      }
    });
  });

  group('Reservations Repository - Test suite for deleteReservation method',
      () {
    test('Given successful datasource response should complete', () async {
      when(mockReservationLocalSource.deleteReservation(reservationId: 1))
          .thenAnswer((realInvocation) async => {});
      await repositoryUnderTesting
          .deleteReservation(reservationId: 1)
          .then((value) {
        expect(true, true, reason: 'Completed successfully');
      });
      verify(mockReservationLocalSource.deleteReservation(reservationId: 1))
          .called(1);
    });

    test('Given a datasource error should return an Exception object',
        () async {
      final error = Exception();
      when(mockReservationLocalSource.deleteReservation(reservationId: 1))
          .thenThrow(error);
      try {
        await repositoryUnderTesting.deleteReservation(reservationId: 1);
      } catch (e) {
        verify(mockReservationLocalSource.deleteReservation(reservationId: 1))
            .called(1);
        expect(e, error);
      }
    });
  });

  group('Reservations Repository - Test suite for createReservation method',
      () {
    final requestModel = ReservationModel(
      dateOfReservation: DateTime.now(),
      hoursOfReservation: 1,
      courtId: 1,
      courtName: 'courtName',
      courtImageUrl: 'courtImageUrl',
      userName: 'userName',
      precipitationProbability: 1,
      maxTemp: 1,
      minTemp: 1,
    );
    test('Given successful datasource response should complete', () async {
      when(mockReservationLocalSource.createReservation(
              reservationModel: captureAnyNamed('reservationModel')))
          .thenAnswer((realInvocation) async => {});
      await repositoryUnderTesting
          .createReservation(reservationModel: requestModel)
          .then((value) {
        expect(true, true, reason: 'Completed successfully');
      });
      verify(mockReservationLocalSource.createReservation(
              reservationModel: captureAnyNamed('reservationModel')))
          .called(1);
    });

    test('Given a datasource error should return an Exception object',
        () async {
      final error = Exception();
      when(mockReservationLocalSource.createReservation(
              reservationModel: captureAnyNamed('reservationModel')))
          .thenThrow(error);
      try {
        await repositoryUnderTesting.createReservation(
            reservationModel: requestModel);
      } catch (e) {
        verify(mockReservationLocalSource.createReservation(
                reservationModel: captureAnyNamed('reservationModel')))
            .called(1);
        expect(e, error);
      }
    });
  });

  group('Reservations Repository - Test suite for getCourtDetail method', () {
    test(
        'Given successful datasource response should return a CourtModel object',
        () async {
      when(mockReservationLocalSource.getCourtData(id: 1))
          .thenAnswer((realInvocation) async => mockCourtData);
      final result = await repositoryUnderTesting.getCourtDetail(courtId: 1);
      verify(mockReservationLocalSource.getCourtData(id: 1)).called(1);
      expect(result, mockCourtData);
    });

    test('Given a datasource error should return an Exception object',
        () async {
      final error = Exception();
      when(mockReservationLocalSource.getCourtData(id: 1)).thenThrow(error);
      try {
        await repositoryUnderTesting.getCourtDetail(courtId: 1);
      } catch (e) {
        verify(mockReservationLocalSource.getCourtData(id: 1)).called(1);
        expect(e, error);
      }
    });
  });

  group('Reservations Repository - Test suite for getCourts method', () {
    test(
        'Given successful datasource response should return a List of CourtModel',
            () async {
          when(mockReservationLocalSource.getCourts())
              .thenAnswer((realInvocation) async => mockCourtList);
          final result = await repositoryUnderTesting.getCourts();
          verify(mockReservationLocalSource.getCourts()).called(1);
          expect(result, mockCourtList);
        });

    test('Given a datasource error should return an Exception object',
            () async {
          final error = Exception();
          when(mockReservationLocalSource.getCourts()).thenThrow(error);
          try {
            await repositoryUnderTesting.getCourts();
          } catch (e) {
            verify(mockReservationLocalSource.getCourts()).called(1);
            expect(e, error);
          }
        });
  });
}
