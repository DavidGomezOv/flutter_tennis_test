import 'package:flutter/material.dart';
import 'package:flutter_tennis_test/domain/models/reservation/court_model.dart';
import 'package:flutter_tennis_test/domain/models/reservation/reservation_model.dart';
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
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      routes: Routes.routes,
      initialRoute: Routes.reservations,
    );
  }
}
