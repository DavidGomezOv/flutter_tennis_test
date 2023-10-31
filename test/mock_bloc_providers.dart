import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_tennis_test/presentation/pages/create_reservation/bloc/create_reservation_bloc.dart';
import 'package:flutter_tennis_test/presentation/pages/reservations/bloc/reservations_bloc.dart';

class MockReservationsBloc
    extends MockBloc<ReservationsEvent, ReservationsState>
    implements ReservationsBloc {}

class MockCreateReservationBloc
    extends MockBloc<CreateReservationEvent, CreateReservationState>
    implements CreateReservationBloc {}
