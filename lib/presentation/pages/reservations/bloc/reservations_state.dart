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

class ErrorState extends ReservationsState {
  const ErrorState({required this.errorMessage});

  final String errorMessage;
}
