part of 'reservations_bloc.dart';

abstract class ReservationsEvent {
  const ReservationsEvent();
}

class FetchReservations extends ReservationsEvent {
  const FetchReservations();
}

class DeleteReservationEvent extends ReservationsEvent {
  const DeleteReservationEvent({required this.reservationId});

  final int reservationId;
}
