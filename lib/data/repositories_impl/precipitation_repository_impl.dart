import 'package:flutter_tennis_test/data/datasources/remote/precipitation_data_api.dart';
import 'package:flutter_tennis_test/domain/models/precipitation/precipitation_model.dart';
import 'package:flutter_tennis_test/domain/repositories/precipitation_repository.dart';

class PrecipitationRepositoryImpl implements PrecipitationRepository {
  final PrecipitationDataApi precipitationDataApi;

  PrecipitationRepositoryImpl({required this.precipitationDataApi});

  @override
  Future<PrecipitationModel> getReservations() {
    // TODO: implement getReservations
    throw UnimplementedError();
  }
}
