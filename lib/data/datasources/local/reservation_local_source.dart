import 'package:flutter/foundation.dart';
import 'package:flutter_tennis_test/domain/models/reservation/reservation_model.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class ReservationLocalSource {
  final String boxName = 'reservations';

  Future<Box<ReservationModel>> openHiveBox() async {
    if (!kIsWeb && !Hive.isBoxOpen(boxName)) {
      Hive.init((await getApplicationDocumentsDirectory()).path);
    }
    return await Hive.openBox<ReservationModel>(boxName);
  }

  Future<List<ReservationModel>> getReservations() {
    throw UnimplementedError();
  }
}
