import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tennis_test/domain/models/reservation/court_model.dart';
import 'package:flutter_tennis_test/domain/repositories/precipitation_repository.dart';
import 'package:flutter_tennis_test/domain/repositories/reservations_repository.dart';
import 'package:flutter_tennis_test/presentation/pages/create_reservation/bloc/create_reservation_bloc.dart';
import 'package:flutter_tennis_test/presentation/pages/create_reservation/widgets/button_list_widget.dart';
import 'package:flutter_tennis_test/presentation/pages/create_reservation/widgets/court_image_widget.dart';
import 'package:flutter_tennis_test/presentation/pages/create_reservation/widgets/date_text_field_widget.dart';
import 'package:flutter_tennis_test/presentation/pages/create_reservation/widgets/weather_widget.dart';
import 'package:flutter_tennis_test/routes.dart';

class CreateReservationPage extends StatelessWidget {
  const CreateReservationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateReservationBloc>(
      create: (context) => CreateReservationBloc(
        reservationsRepository: context.read<ReservationsRepository>(),
        precipitationRepository: context.read<PrecipitationRepository>(),
      )..add(LoadCourtsEvent()),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          title: const Text('ADD RESERVATION'),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
        body: BlocListener<CreateReservationBloc, CreateReservationState>(
          listener: (context, state) {
            if (state is SuccessState) {
              Navigator.pushNamed(context, Routes.reservations);
            }
          },
          child: const _Body(),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final reservationDateController = TextEditingController();
    final nameController = TextEditingController();
    List<CourtModel>? courtList = [];
    return BlocBuilder<CreateReservationBloc, CreateReservationState>(
      builder: (context, state) {
        if (state is InitialState ||
            state is UpdateValuesState ||
            state is LoadedCourtsState ||
            state is LoadedWeatherReportState) {
          if (state is LoadedCourtsState) {
            courtList = state.courts;
          }
          return SingleChildScrollView(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CourtImageWidget(),
                    const SizedBox(
                      height: 20,
                    ),
                    const Center(
                      child: Text(
                        'Select the Tennis Court',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:
                          createCourtButtons(state, courtList ?? [], context),
                    ),
                    DateTextFieldWidget(
                        reservationDateController: reservationDateController),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: createTimeButtons(
                        state,
                        context,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: 'Enter your name',
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      child: WeatherWidget(),
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () =>
                            context.read<CreateReservationBloc>().add(
                                  AddReservationEvent(
                                    userName: nameController.text,
                                  ),
                                ),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            'Create Reservation',
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (state is ErrorState) {
          return Center(
            child: Text(state.errorMessage),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
