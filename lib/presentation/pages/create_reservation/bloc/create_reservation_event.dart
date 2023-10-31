part of 'create_reservation_bloc.dart';

abstract class CreateReservationEvent {
  const CreateReservationEvent();
}

class LoadCourtsEvent extends CreateReservationEvent {}

class LoadWeatherReportEvent extends CreateReservationEvent {}

class UpdateValuesEvent extends CreateReservationEvent {
  UpdateValuesEvent({
    this.courtId,
    this.courtName,
    this.courtImage,
    this.reservationDate,
    this.reservationTime,
    this.precipitationProbability,
    this.maxTemp,
    this.minTemp,
  });

  int? courtId;
  String? courtName;
  String? courtImage;
  DateTime? reservationDate;
  int? reservationTime;
  int? precipitationProbability;
  double? maxTemp;
  double? minTemp;
}

class AddReservationEvent extends CreateReservationEvent {
  const AddReservationEvent({
    required this.userName,
  });

  final String userName;
}
