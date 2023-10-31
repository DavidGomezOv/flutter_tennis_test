import 'package:flutter_tennis_test/domain/models/reservation/court_model.dart';
import 'package:flutter_tennis_test/domain/models/reservation/reservation_model.dart';

abstract class ReservationsRepository {
  Future<List<ReservationModel>> getReservations();

  Future<void> deleteReservation({required int reservationId});

  Future<void> createReservation({required ReservationModel reservationModel});

  Future<List<CourtModel>> getCourts();

  Future<CourtModel?> getCourtDetail({required int courtId});
}
