import 'package:flutter/foundation.dart';
import 'package:flutter_tennis_test/domain/models/reservation/court_model.dart';
import 'package:flutter_tennis_test/domain/models/reservation/reservation_model.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class ReservationLocalSource {
  static const String reservationsBox = 'reservations';
  static const String courtsBox = 'courts';

  Future<Box<ReservationModel>> openReservationsBox() async {
    if (!kIsWeb && !Hive.isBoxOpen(reservationsBox)) {
      Hive.init((await getApplicationDocumentsDirectory()).path);
    }
    return await Hive.openBox<ReservationModel>(reservationsBox);
  }

  Future<Box<CourtModel>> openCourtBox() async {
    if (!kIsWeb && !Hive.isBoxOpen(courtsBox)) {
      Hive.init((await getApplicationDocumentsDirectory()).path);
    }
    return await Hive.openBox<CourtModel>(courtsBox);
  }

  Future<List<ReservationModel>> getReservations() async {
    List<ReservationModel> reservations = [];
    final box = await openReservationsBox().catchError((onError) {
      throw (onError);
    });
    for (var element in box.values) {
      element.id = element.key;
      reservations.add(element);
    }
    return reservations;
  }

  Future<void> deleteReservation({required int reservationId}) async {
    final box = Hive.box<ReservationModel>(reservationsBox);
    await box.delete(reservationId).catchError((onError) {
      throw (onError);
    });
  }

  Future<void> createReservation({required ReservationModel reservationModel}) async {
    final box = await Hive.openBox<ReservationModel>(reservationsBox);
    await box.add(reservationModel);
  }

  Future<CourtModel?> getCourtData({required int id}) async {
    final box = await openCourtBox().catchError((onError) {
      throw (onError);
    });
    final data = box.get(id);
    return data;
  }

  Future<List<CourtModel>> getCourts() async {
    List<CourtModel> courts = [];
    final box = await openCourtBox().catchError((onError) {
      throw (onError);
    });
    for (var element in box.values) {
      element.id = element.key;
      courts.add(element);
    }
    return courts;
  }

  Future<void> saveTestCourts() async {
    final reservations = await getCourts();
    if (reservations.isNotEmpty) {
      return;
    }
    final data = [
      CourtModel(
        name: 'Court A',
        lat: 10.0024,
        lng: -84.1155,
        imageUrl:
            'https://www.canvasartrocks.com/cdn/shop/products/Whole_tennis_court_Wall_Mural_Wallpaper_a_1400x.jpg?v=1578614160',
      ),
      CourtModel(
        name: 'Court B',
        lat: 10.0024,
        lng: -84.1155,
        imageUrl: 'https://www.austadiums.com/stadiums/photos/MCA-21.jpg',
      ),
      CourtModel(
        name: 'Court C',
        lat: 10.0024,
        lng: -84.1155,
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/6/6a/Rexall_Centre_York_University_Toronto.JPG',
      ),
    ];

    final box = await Hive.openBox<CourtModel>(courtsBox);
    for (var element in data) {
      await box.add(element);
    }
  }
}
