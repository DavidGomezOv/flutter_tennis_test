part of 'reservations_bloc.dart';

abstract class ReservationsEvent {
  const ReservationsEvent();
}

class FetchReservationsEvent extends ReservationsEvent {
  const FetchReservationsEvent();
}

class DeleteReservationEvent extends ReservationsEvent {
  const DeleteReservationEvent({required this.reservationId});

  final int reservationId;
}

class ShowReservationDetailEvent extends ReservationsEvent {
  ShowReservationDetailEvent({required this.reservationModel});

  final ReservationModel reservationModel;
}
