import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collection/collection.dart';
import 'package:flutter_tennis_test/core/extensions/generic_extensions.dart';
import 'package:flutter_tennis_test/domain/models/precipitation/precipitation_model.dart';
import 'package:flutter_tennis_test/domain/models/precipitation/weather_model.dart';
import 'package:flutter_tennis_test/domain/models/reservation/court_model.dart';
import 'package:flutter_tennis_test/domain/models/reservation/reservation_model.dart';
import 'package:flutter_tennis_test/domain/repositories/precipitation_repository.dart';
import 'package:flutter_tennis_test/domain/repositories/reservations_repository.dart';

part 'create_reservation_event.dart';

part 'create_reservation_state.dart';

class CreateReservationBloc
    extends Bloc<CreateReservationEvent, CreateReservationState> {
  CreateReservationBloc({
    required this.reservationsRepository,
    required this.precipitationRepository,
  }) : super(InitialState()) {
    on<LoadCourtsEvent>(
      (event, emit) => _getCourtsData(emit),
    );
    on<LoadWeatherReportEvent>(
      (event, emit) => _getWeatherReport(emit),
    );
    on<UpdateValuesEvent>(
      (event, emit) => emit(
        UpdateValuesState(
          reservationModel: _createReservationObject(
            reservationDate: event.reservationDate,
            hoursOfReservation: event.reservationTime,
            courtId: event.courtId,
            courtName: event.courtName,
            courtImageUrl: event.courtImage,
            precipitationProbability: event.precipitationProbability,
          ),
          maxTemperature: event.maxTemp,
          minTemperature: event.minTemp,
        ),
      ),
    );
    on<AddReservationEvent>(
      (event, emit) => _addReservation(event.userName, emit),
    );
    reservationModel = ReservationModel(
        dateOfReservation: null,
        hoursOfReservation: 1,
        courtId: -1,
        courtName: '',
        courtImageUrl: '',
        userName: '',
        precipitationProbability: 1);
  }

  final ReservationsRepository reservationsRepository;
  final PrecipitationRepository precipitationRepository;

  late ReservationModel reservationModel;

  Future<void> _addReservation(
      String userName, Emitter<CreateReservationState> emit) async {
    bool validDate = true;
    int timesReserved = 0;

    final reservations = await reservationsRepository.getReservations();

    for (final reservation in reservations) {
      if (reservation.courtId == reservationModel.courtId) {
        if (reservationModel.dateOfReservation!
                .isAfter(reservation.dateOfReservation!) &&
            reservationModel.dateOfReservation!.isBefore(reservation
                .dateOfReservation!
                .add(Duration(hours: reservation.hoursOfReservation)))) {
          validDate = false;
        } else if (reservation.dateOfReservation!.formatSimpleDate() ==
            reservationModel.dateOfReservation!.formatSimpleDate()) {
          timesReserved += 1;
        }
      }
    }

    if (validDate == false) {
      return;
    } else if (timesReserved >= 3) {
      return;
    } else if (userName.isEmpty) {
      return;
    }

    emit(const LoadingState());

    await reservationsRepository
        .createReservation(
            reservationModel: _createReservationObject(userName: userName))
        .then((reservations) {
      emit(const SuccessState());
    }).catchError((error) {
      emit(ErrorState(errorMessage: error.toString()));
    });
  }

  ReservationModel _createReservationObject({
    DateTime? reservationDate,
    int? hoursOfReservation,
    int? courtId,
    String? courtName,
    String? courtImageUrl,
    String? userName,
    int? precipitationProbability,
  }) {
    reservationModel = ReservationModel(
      dateOfReservation: reservationDate ?? reservationModel.dateOfReservation,
      hoursOfReservation:
          hoursOfReservation ?? reservationModel.hoursOfReservation,
      courtId: courtId ?? reservationModel.courtId,
      courtName: courtName ?? reservationModel.courtName,
      courtImageUrl: courtImageUrl ?? reservationModel.courtImageUrl,
      userName: userName ?? reservationModel.userName,
      precipitationProbability:
          precipitationProbability ?? reservationModel.precipitationProbability,
    );
    return reservationModel;
  }

  Future<void> _getCourtsData(Emitter<CreateReservationState> emit) async {
    emit(const LoadingState());

    await reservationsRepository.getCourts().then((courts) {
      if (courts.isNotEmpty) {
        _createReservationObject(
          courtId: courts.first.id,
          courtName: courts.first.name,
          courtImageUrl: courts.first.imageUrl,
        );
        emit(LoadedCourtsState(courts: courts));
      } else {
        emit(const ErrorState(
            errorMessage:
                'There are no courts, please reload the application'));
      }
    }).catchError((error) {
      emit(ErrorState(errorMessage: error.toString()));
    });
  }

  Future<void> _getWeatherReport(Emitter<CreateReservationState> emit) async {
    final courtModel = await reservationsRepository.getCourtDetail(
        courtId: reservationModel.courtId);
    if (courtModel == null) return;
    await precipitationRepository
        .getWeatherData(lat: courtModel.lat, lng: courtModel.lng)
        .then((weatherData) {
      final dailyWeatherData = _createDailyWeatherModel(weatherData);
      emit(LoadedWeatherReportState(
        dailyWeatherData: dailyWeatherData,
        reportNotAvailable: dailyWeatherData == null,
      ));
    });
  }

  DailyWeatherData? _createDailyWeatherModel(WeatherModel weatherData) {
    late DailyWeatherData? dailyWeatherData;
    final listHourlyData = weatherData.hourlyData;
    late HourlyData? hourlyData;
    final dailyData = weatherData.dailyData?.firstWhereOrNull(
      (element) =>
          element.time ==
          reservationModel.dateOfReservation!.formatSimpleDate(),
    );

    for (int i = 0; i < listHourlyData!.length - 1; i++) {
      if (reservationModel.dateOfReservation ==
              listHourlyData[i].time.formatStringDate() ||
          (reservationModel.dateOfReservation!
                  .isAfter(listHourlyData[i].time.formatStringDate()) &&
              reservationModel.dateOfReservation!
                  .isBefore(listHourlyData[i + 1].time.formatStringDate()))) {
        hourlyData = listHourlyData[i];
      }
    }

    if (dailyData == null || hourlyData == null) return null;
    dailyWeatherData = DailyWeatherData(
      precipitationProbability: hourlyData.precipitationProbability,
      maxTemperature: dailyData.maxTemperature,
      minTemperature: dailyData.minTemperature,
    );
    return dailyWeatherData;
  }
}
