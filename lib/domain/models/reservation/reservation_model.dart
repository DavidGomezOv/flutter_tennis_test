import 'package:hive/hive.dart';

part 'reservation_model.g.dart';

@HiveType(typeId: 1)
class ReservationModel extends HiveObject {
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

  ReservationModel({
    required this.dateOfReservation,
    required this.hoursOfReservation,
    required this.courtId,
    required this.courtName,
    required this.courtImageUrl,
    required this.userName,
    required this.precipitationProbability,
  });
}
