part of 'create_reservation_bloc.dart';

abstract class CreateReservationState {
  const CreateReservationState();
}

class InitialState extends CreateReservationState {}

class UpdateValuesState extends CreateReservationState {
  const UpdateValuesState({
    required this.reservationModel,
    required this.maxTemperature,
    required this.minTemperature,
  });

  final ReservationModel reservationModel;
  final double? maxTemperature;
  final double? minTemperature;
}

class LoadingState extends CreateReservationState {
  const LoadingState();
}

class LoadedCourtsState extends CreateReservationState {
  const LoadedCourtsState({required this.courts});

  final List<CourtModel> courts;
}

class LoadedWeatherReportState extends CreateReservationState {
  const LoadedWeatherReportState({
    required this.dailyWeatherData,
    this.reportNotAvailable = false,
  });

  final DailyWeatherData? dailyWeatherData;
  final bool reportNotAvailable;
}

class SuccessState extends CreateReservationState {
  const SuccessState();
}

class ErrorState extends CreateReservationState {
  const ErrorState({required this.errorMessage});

  final String errorMessage;
}
