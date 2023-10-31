import 'package:hive/hive.dart';

part 'court_model.g.dart';

@HiveType(typeId: 0)
class CourtModel extends HiveObject {
  int? id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final double lat;
  @HiveField(3)
  final double lng;
  @HiveField(4)
  final String imageUrl;

  CourtModel({
    required this.name,
    required this.lat,
    required this.lng,
    required this.imageUrl,
  });
}
