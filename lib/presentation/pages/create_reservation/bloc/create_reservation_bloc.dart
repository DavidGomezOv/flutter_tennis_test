import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tennis_test/domain/models/reservation/reservation_model.dart';

part 'create_reservation_event.dart';

part 'create_reservation_state.dart';

class CreateReservationBloc
    extends Bloc<CreateReservationEvent, CreateReservationState> {
  CreateReservationBloc() : super(InitialState()) {
    on<CreateReservationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
