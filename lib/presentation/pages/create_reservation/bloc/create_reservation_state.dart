part of 'create_reservation_bloc.dart';

abstract class CreateReservationState {
  const CreateReservationState();
}

class InitialState extends CreateReservationState {}

class LoadingState extends CreateReservationState {
  const LoadingState();
}

class SuccessState extends CreateReservationState {
  const SuccessState();
}

class ErrorState extends CreateReservationState {
  const ErrorState({required this.errorMessage});

  final String errorMessage;
}
