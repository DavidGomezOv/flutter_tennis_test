part of 'reservations_bloc.dart';

abstract class ReservationsState {
  const ReservationsState();
}

class InitialState extends ReservationsState {}

class LoadingState extends ReservationsState {
  const LoadingState();
}

class SuccessState extends ReservationsState {
  const SuccessState({required this.reservations});

  final List<ReservationModel> reservations;
}

class SuccessDeleteState extends ReservationsState {
  const SuccessDeleteState();
}

class ErrorState extends ReservationsState {
  const ErrorState({required this.errorMessage});

  final String errorMessage;
}

class ShowReservationDetailState extends ReservationsState {
  const ShowReservationDetailState({required this.reservationModel});

  final ReservationModel reservationModel;
}
