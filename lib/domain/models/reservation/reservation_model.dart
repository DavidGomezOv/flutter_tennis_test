import 'package:hive/hive.dart';

part 'reservation_model.g.dart';

@HiveType(typeId: 1)
class ReservationModel extends HiveObject  {
  int? id;
  @HiveField(1)
  final DateTime? dateOfReservation;
  @HiveField(2)
  final int hoursOfReservation;
  @HiveField(3)
  final int courtId;
  @HiveField(4)
  final String courtName;
  @HiveField(5)
  final String courtImageUrl;
  @HiveField(6)
  final String userName;
  @HiveField(7)
  final int precipitationProbability;
  @HiveField(8)
  final double? maxTemp;
  @HiveField(9)
  final double? minTemp;

  ReservationModel({
    required this.dateOfReservation,
    required this.hoursOfReservation,
    required this.courtId,
    required this.courtName,
    required this.courtImageUrl,
    required this.userName,
    required this.precipitationProbability,
    required this.maxTemp,
    required this.minTemp,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReservationModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          dateOfReservation == other.dateOfReservation &&
          hoursOfReservation == other.hoursOfReservation &&
          courtId == other.courtId &&
          courtName == other.courtName &&
          courtImageUrl == other.courtImageUrl &&
          userName == other.userName &&
          precipitationProbability == other.precipitationProbability &&
          maxTemp == other.maxTemp &&
          minTemp == other.minTemp;

  @override
  int get hashCode =>
      id.hashCode ^
      dateOfReservation.hashCode ^
      hoursOfReservation.hashCode ^
      courtId.hashCode ^
      courtName.hashCode ^
      courtImageUrl.hashCode ^
      userName.hashCode ^
      precipitationProbability.hashCode ^
      maxTemp.hashCode ^
      minTemp.hashCode;
}
