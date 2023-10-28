import 'package:flutter/material.dart';
import 'package:flutter_tennis_test/presentation/pages/create_reservation/create_reservation_page.dart';
import 'package:flutter_tennis_test/presentation/pages/reservations/reservations_page.dart';

class Routes {
  static const String reservations = '/reservations';
  static const String createReservations = '/create_reservations';

  static final routes = <String, WidgetBuilder>{
    reservations: (context) => const ReservationsPage(),
    createReservations: (context) => const CreateReservationPage(),
  };
}
