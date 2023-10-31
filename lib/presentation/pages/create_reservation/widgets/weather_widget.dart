import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tennis_test/core/extensions/generic_extensions.dart';
import 'package:flutter_tennis_test/domain/models/precipitation/daily_weather_model.dart';
import 'package:flutter_tennis_test/presentation/pages/create_reservation/bloc/create_reservation_bloc.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateReservationBloc, CreateReservationState>(
      builder: (context, state) {
        DailyWeatherData? dailyWeatherModel;
        if (state is LoadedWeatherReportState) {
          dailyWeatherModel = (state).dailyWeatherData;
          context.read<CreateReservationBloc>().add(
                UpdateValuesEvent(
                  precipitationProbability:
                      dailyWeatherModel?.precipitationProbability,
                  maxTemp: dailyWeatherModel?.maxTemperature,
                  minTemp: dailyWeatherModel?.minTemperature,
                ),
              );
        } else if (state is UpdateValuesState) {
          if ((state).reservationModel.maxTemp == null ||
              (state).reservationModel.minTemp == null) {
            return (state).reservationModel.dateOfReservation == null
                ? const SizedBox.shrink()
                : Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        'Weather report not available for selected date',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  );
          }
          dailyWeatherModel = DailyWeatherData(
            precipitationProbability:
                (state).reservationModel.precipitationProbability,
            maxTemperature: (state).reservationModel.maxTemp,
            minTemperature: (state).reservationModel.minTemp,
          );
        }
        if (dailyWeatherModel == null) {
          return const SizedBox.shrink();
        }
        return Container(
          height: 80,
          decoration: BoxDecoration(
            color:
                dailyWeatherModel.precipitationProbability!.getWeatherColor(),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 20,
              ),
              const Text(
                'Precipitation\nProbability',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              const SizedBox(
                width: 6,
              ),
              const Text(
                ':',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              const SizedBox(
                width: 6,
              ),
              Text(
                '${dailyWeatherModel.precipitationProbability.toString()}%',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'High Temp: ${dailyWeatherModel.maxTemperature?.toString()}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Low Temp: ${dailyWeatherModel.minTemperature?.toString()}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
        );
      },
    );
  }
}
