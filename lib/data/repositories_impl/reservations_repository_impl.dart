import 'package:flutter_tennis_test/data/datasources/local/reservation_local_source.dart';
import 'package:flutter_tennis_test/domain/models/reservation/reservation_model.dart';
import 'package:flutter_tennis_test/domain/repositories/reservations_repository.dart';

class ReservationsRepositoryImpl implements ReservationsRepository {
  final ReservationLocalSource reservationLocalSource;

  ReservationsRepositoryImpl({required this.reservationLocalSource});

  @override
  Future<ReservationModel> getReservations() {
    // TODO: implement getReservations
    throw UnimplementedError();
  }
}
