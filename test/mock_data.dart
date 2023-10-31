import 'package:flutter_tennis_test/data/models/precipitation_response_model.dart';
import 'package:flutter_tennis_test/domain/models/precipitation/precipitation_model.dart';
import 'package:flutter_tennis_test/domain/models/reservation/court_model.dart';
import 'package:flutter_tennis_test/domain/models/reservation/reservation_model.dart';

final mockReservationsList = [
  ReservationModel(
    dateOfReservation: DateTime(2023, 11, 9),
    hoursOfReservation: 1,
    courtId: 1,
    courtName: 'courtName',
    courtImageUrl: 'https://www.austadiums.com/stadiums/photos/MCA-21.jpg',
    userName: 'userName',
    precipitationProbability: 1,
    maxTemp: 1,
    minTemp: 1,
  ),
  ReservationModel(
    dateOfReservation: DateTime(2023, 11, 10),
    hoursOfReservation: 2,
    courtId: 2,
    courtName: 'courtName',
    courtImageUrl: 'https://www.austadiums.com/stadiums/photos/MCA-21.jpg',
    userName: 'userName2',
    precipitationProbability: 2,
    maxTemp: 2,
    minTemp: 2,
  ),
  ReservationModel(
    dateOfReservation: DateTime(2023, 11, 11),
    hoursOfReservation: 3,
    courtId: 3,
    courtName: 'courtName',
    courtImageUrl: 'https://www.austadiums.com/stadiums/photos/MCA-21.jpg',
    userName: 'userName3',
    precipitationProbability: 3,
    maxTemp: 3,
    minTemp: 3,
  ),
];

final mockReservationModel = ReservationModel(
  dateOfReservation: DateTime(2023, 12, 12),
  hoursOfReservation: 1,
  courtId: 1,
  courtName: 'courtName',
  courtImageUrl: 'courtImage',
  userName: '',
  precipitationProbability: 1,
  maxTemp: 1,
  minTemp: 1,
);

final mockCourtData =
    CourtModel(name: 'name', lat: 1, lng: 1, imageUrl: 'imageUrl');

final mockCourtList = [
  CourtModel(name: 'name', lat: 1, lng: 1, imageUrl: 'imageUrl'),
  CourtModel(name: 'name', lat: 2, lng: 2, imageUrl: 'imageUrl'),
  CourtModel(name: 'name', lat: 3, lng: 3, imageUrl: 'imageUrl')
];

final mockPrecipitationModel = PrecipitationResponseModel(
  hourly: Hourly(
    time: ['time'],
    precipitationProbability: [1],
  ),
  daily: Daily(
    time: ['time'],
    apparentTemperatureMax: [1],
    apparentTemperatureMin: [1],
  ),
);

final mockWeatherModel = WeatherModel(
  hourlyData: [
    HourlyData(time: 'time', precipitationProbability: 1),
  ],
  dailyData: [
    DailyData(time: 'time', maxTemperature: 1, minTemperature: 1),
  ],
);
