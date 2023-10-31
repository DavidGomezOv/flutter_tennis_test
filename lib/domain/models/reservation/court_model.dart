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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CourtModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          lat == other.lat &&
          lng == other.lng &&
          imageUrl == other.imageUrl;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      lat.hashCode ^
      lng.hashCode ^
      imageUrl.hashCode;
}
