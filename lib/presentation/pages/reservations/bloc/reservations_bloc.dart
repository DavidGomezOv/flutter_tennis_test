import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tennis_test/domain/models/reservation/reservation_model.dart';
import 'package:flutter_tennis_test/domain/repositories/reservations_repository.dart';

part 'reservations_event.dart';

part 'reservations_state.dart';

class ReservationsBloc extends Bloc<ReservationsEvent, ReservationsState> {
  ReservationsBloc({required this.reservationsRepository})
      : super(InitialState()) {
    on<FetchReservationsEvent>(
      (event, emit) => _fetchReservations(emit),
    );
    on<DeleteReservationEvent>(
      (event, emit) => _deleteReservation(event.reservationId, emit),
    );
  }

  final ReservationsRepository reservationsRepository;

  Future<void> _fetchReservations(Emitter<ReservationsState> emit) async {
    emit(const LoadingState());

    await reservationsRepository.getReservations().then((reservations) {
      if (reservations.isNotEmpty) {
        reservations.sort(
          (a, b) => a.dateOfReservation!.compareTo(b.dateOfReservation!),
        );
        emit(SuccessState(reservations: reservations));
      } else {
        emit(const ErrorState(
            errorMessage: 'There are no reservations for now'));
      }
    }).catchError((error) {
      emit(ErrorState(errorMessage: error.toString()));
    });
  }

  Future<void> _deleteReservation(
      int reservationId, Emitter<ReservationsState> emit) async {
    emit(const LoadingState());

    await reservationsRepository
        .deleteReservation(reservationId: reservationId)
        .then((reservations) {
      emit(const SuccessDeleteState());
    }).catchError((error) {
      emit(ErrorState(errorMessage: error.toString()));
    });
  }
}
