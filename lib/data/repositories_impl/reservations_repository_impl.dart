import 'package:flutter_tennis_test/data/datasources/local/reservation_local_source.dart';
import 'package:flutter_tennis_test/domain/models/reservation/court_model.dart';
import 'package:flutter_tennis_test/domain/models/reservation/reservation_model.dart';
import 'package:flutter_tennis_test/domain/repositories/reservations_repository.dart';

class ReservationsRepositoryImpl implements ReservationsRepository {
  final ReservationLocalSource reservationLocalSource;

  ReservationsRepositoryImpl({required this.reservationLocalSource});

  @override
  Future<List<ReservationModel>> getReservations() =>
      reservationLocalSource.getReservations();

  @override
  Future<void> deleteReservation({required int reservationId}) =>
      reservationLocalSource.deleteReservation(reservationId);

  @override
  Future<void> createReservation(
          {required ReservationModel reservationModel}) =>
      reservationLocalSource.createReservation(reservationModel);

  @override
  Future<CourtModel?> getCourtDetail({required int courtId}) =>
      reservationLocalSource.getCourtData(courtId);

  @override
  Future<List<CourtModel>> getCourts() => reservationLocalSource.getCourts();
}
