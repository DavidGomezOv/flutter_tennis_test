import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tennis_test/domain/repositories/reservations_repository.dart';
import 'package:flutter_tennis_test/presentation/pages/reservations/bloc/reservations_bloc.dart';
import 'package:flutter_tennis_test/presentation/pages/reservations/widgets/confirm_delete_dialog.dart';
import 'package:flutter_tennis_test/presentation/pages/reservations/widgets/detail_reservation_dialog.dart';
import 'package:flutter_tennis_test/presentation/pages/reservations/widgets/reservation_list_item.dart';
import 'package:flutter_tennis_test/routes.dart';

class ReservationsPage extends StatelessWidget {
  const ReservationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReservationsBloc>(
      create: (context) => ReservationsBloc(
        reservationsRepository: context.read<ReservationsRepository>(),
      )..add(const FetchReservationsEvent()),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          title: const Text('RESERVATIONS'),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
        body: BlocListener<ReservationsBloc, ReservationsState>(
          listener: (context, state) {
            if (state is SuccessDeleteState) {
              Navigator.popAndPushNamed(context, Routes.reservations);
            }
          },
          child: const _Body(),
        ),
        floatingActionButton: FloatingActionButton.extended(
          label: const Text(
            'Add Reservation',
            style: TextStyle(fontSize: 18),
          ),
          onPressed: () =>
              Navigator.pushNamed(context, Routes.createReservations),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<ReservationsBloc>().add(const FetchReservationsEvent());
      },
      child: BlocBuilder<ReservationsBloc, ReservationsState>(
        builder: (context, state) {
          if (state is SuccessState) {
            return ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: state.reservations.length,
              itemBuilder: (context, index) => ReservationListItem(
                reservationModel: state.reservations[index],
                onReservationTap: (reservationModel) {
                  showDialog(
                    context: context,
                    builder: (_) => DetailReservationDialog(
                      reservationModel: state.reservations[index],
                      onDeleteTap: () => context.read<ReservationsBloc>().add(
                          DeleteReservationEvent(
                              reservationId: state.reservations[index].id!)),
                    ),
                  );
                },
                onDeleteTap: (int reservationId) {
                  showDialog(
                    context: context,
                    builder: (_) => ConfirmDeleteDialog(
                      reservationId: reservationId,
                      onDeleteTap: () => context.read<ReservationsBloc>().add(
                            DeleteReservationEvent(
                                reservationId: reservationId),
                          ),
                    ),
                  );
                },
              ),
            );
          } else if (state is ErrorState) {
            return Stack(
              children: <Widget>[
                ListView(),
                Center(
                  child: Text(state.errorMessage),
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
