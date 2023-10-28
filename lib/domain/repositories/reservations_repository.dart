import 'package:flutter_tennis_test/domain/models/reservation/reservation_model.dart';

abstract class ReservationsRepository {
  Future<ReservationModel> getReservations();
}
