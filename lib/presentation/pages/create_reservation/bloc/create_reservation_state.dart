part of 'create_reservation_bloc.dart';

abstract class CreateReservationState extends Equatable {
  const CreateReservationState();
}

class InitialState extends CreateReservationState {
  @override
  List<Object?> get props => [];
}

class UpdateValuesState extends CreateReservationState {
  const UpdateValuesState({
    required this.reservationModel,
    this.validationError,
  });

  final ReservationModel reservationModel;
  final String? validationError;

  @override
  List<Object?> get props => [reservationModel, validationError];
}

class LoadingState extends CreateReservationState {
  const LoadingState();

  @override
  List<Object?> get props => [];
}

class LoadedCourtsState extends CreateReservationState {
  const LoadedCourtsState({required this.courts});

  final List<CourtModel> courts;

  @override
  List<Object?> get props => [courts];
}

class LoadedWeatherReportState extends CreateReservationState {
  const LoadedWeatherReportState({
    required this.dailyWeatherData,
  });

  final DailyWeatherData? dailyWeatherData;

  @override
  List<Object?> get props => [dailyWeatherData];
}

class SuccessState extends CreateReservationState {
  const SuccessState();

  @override
  List<Object?> get props => [];
}

class ErrorState extends CreateReservationState {
  const ErrorState({required this.errorMessage});

  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}
