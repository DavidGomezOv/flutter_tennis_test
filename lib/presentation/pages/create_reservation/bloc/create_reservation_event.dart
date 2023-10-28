part of 'create_reservation_bloc.dart';

abstract class CreateReservationEvent {
  const CreateReservationEvent();
}

class NewReservationEvent extends CreateReservationEvent {
  const NewReservationEvent({required this.reservationModel});

  final ReservationModel reservationModel;
}
