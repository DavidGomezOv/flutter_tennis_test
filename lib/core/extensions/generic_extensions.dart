import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateString on DateTime {
  String formatDate() => DateFormat('EE d MMM, yyyy').format(this);

  String formatDateWithHour() =>
      DateFormat('MMM d, yyyy - h:mm aaa').format(this);

  String formatSimpleDateWithHour() => DateFormat('dd-MM-yyyy-HH-mm').format(this);

  String formatSimpleDate() => DateFormat('yyyy-MM-dd').format(this);
}

extension StringToDate on String {
  DateTime formatStringDate() => DateTime.parse(this);
}

extension WeatherColor on int {
  Color getWeatherColor() {
    if (this > 0 && this <= 30) {
      return Colors.lightBlueAccent;
    } else if (this > 30 && this <= 60) {
      return Colors.blue;
    } else {
      return Colors.blueGrey;
    }
  }
}
