import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tennis_test/domain/models/reservation/court_model.dart';
import 'package:flutter_tennis_test/presentation/pages/create_reservation/bloc/create_reservation_bloc.dart';

List<Widget> createCourtButtons(CreateReservationState state,
    List<CourtModel>? courts, BuildContext context) {
  List<Widget> items = [];
  final selectedCourt = state is UpdateValuesState
      ? state.reservationModel.courtId
      : state is LoadedCourtsState
          ? courts?.first.id ?? -1
          : -1;
  for (final element in courts!) {
    items.add(
      ElevatedButton(
        onPressed: () {
          context.read<CreateReservationBloc>().add(
                UpdateValuesEvent(
                  courtId: element.id,
                  courtName: element.name,
                  courtImage: element.imageUrl,
                  precipitationProbability: state is UpdateValuesState
                      ? state.reservationModel.precipitationProbability
                      : null,
                  maxTemp: state is UpdateValuesState
                      ? state.reservationModel.maxTemp
                      : null,
                  minTemp: state is UpdateValuesState
                      ? state.reservationModel.minTemp
                      : null,
                ),
              );
        },
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(element.id == selectedCourt
              ? Theme.of(context).primaryColor
              : Colors.grey),
        ),
        child: Text(element.name),
      ),
    );
  }
  return items;
}

List<Widget> createTimeButtons(
    CreateReservationState state, BuildContext context) {
  List<Widget> items = [];
  final selectedTime = state is UpdateValuesState
      ? state.reservationModel.hoursOfReservation
      : 1;
  for (int i = 1; i < 4; i++) {
    items.add(
      ElevatedButton(
        onPressed: () {
          context.read<CreateReservationBloc>().add(UpdateValuesEvent(
                reservationTime: i,
                precipitationProbability: state is UpdateValuesState
                    ? state.reservationModel.precipitationProbability
                    : null,
                maxTemp: state is UpdateValuesState
                    ? state.reservationModel.maxTemp
                    : null,
                minTemp: state is UpdateValuesState
                    ? state.reservationModel.minTemp
                    : null,
              ));
        },
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
              i == selectedTime ? Theme.of(context).primaryColor : Colors.grey),
        ),
        child: Text('$i hours'),
      ),
    );
  }
  return items;
}
