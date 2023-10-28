import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tennis_test/domain/models/reservation/reservation_model.dart';

part 'reservations_event.dart';

part 'reservations_state.dart';

class ReservationsBloc extends Bloc<ReservationsEvent, ReservationsState> {
  ReservationsBloc() : super(InitialState()) {
    on<ReservationsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
