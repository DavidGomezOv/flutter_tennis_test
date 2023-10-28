// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'court_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CourtModelAdapter extends TypeAdapter<CourtModel> {
  @override
  final int typeId = 0;

  @override
  CourtModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CourtModel(
      name: fields[1] as String,
      lat: fields[2] as double,
      lng: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, CourtModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.lat)
      ..writeByte(3)
      ..write(obj.lng);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CourtModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
