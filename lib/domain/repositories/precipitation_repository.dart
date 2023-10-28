import 'package:flutter_tennis_test/domain/models/precipitation/precipitation_model.dart';

abstract class PrecipitationRepository {
  Future<PrecipitationModel> getReservations();
}
