import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tennis_test/data/datasources/local/reservation_local_source.dart';
import 'package:flutter_tennis_test/data/datasources/remote/weather_data_api.dart';
import 'package:flutter_tennis_test/data/repositories_impl/weather_repository_impl.dart';
import 'package:flutter_tennis_test/data/repositories_impl/reservations_repository_impl.dart';
import 'package:flutter_tennis_test/domain/models/reservation/court_model.dart';
import 'package:flutter_tennis_test/domain/models/reservation/reservation_model.dart';
import 'package:flutter_tennis_test/domain/repositories/weather_repository.dart';
import 'package:flutter_tennis_test/domain/repositories/reservations_repository.dart';
import 'package:flutter_tennis_test/routes.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _initHive();
  runApp(const MyApp());
}

void _initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CourtModelAdapter());
  Hive.registerAdapter(ReservationModelAdapter());
  await ReservationLocalSource().saveTestCourts();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<WeatherRepository>(
          create: (context) => WeatherRepositoryImpl(
            weatherDataApi: WeatherDataApi(),
          ),
        ),
        RepositoryProvider<ReservationsRepository>(
          create: (context) => ReservationsRepositoryImpl(
            reservationLocalSource: ReservationLocalSource(),
          ),
        ),
      ],
      child: MaterialApp(
        routes: Routes.routes,
        initialRoute: Routes.reservations,
      ),
    );
  }
}
