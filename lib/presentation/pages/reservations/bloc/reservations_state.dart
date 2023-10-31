part of 'reservations_bloc.dart';

abstract class ReservationsState extends Equatable {
  const ReservationsState();
}

class InitialState extends ReservationsState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends ReservationsState {
  const LoadingState();

  @override
  List<Object?> get props => [];
}

class SuccessState extends ReservationsState {
  const SuccessState({required this.reservations});

  final List<ReservationModel> reservations;

  @override
  List<Object?> get props => [reservations];
}

class SuccessDeleteState extends ReservationsState {
  const SuccessDeleteState();

  @override
  List<Object?> get props => [];
}

class ErrorState extends ReservationsState {
  const ErrorState({required this.errorMessage});

  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}

class ShowReservationDetailState extends ReservationsState {
  const ShowReservationDetailState({required this.reservationModel});

  final ReservationModel reservationModel;

  @override
  List<Object?> get props => [reservationModel];
}
