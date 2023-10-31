// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReservationModelAdapter extends TypeAdapter<ReservationModel> {
  @override
  final int typeId = 1;

  @override
  ReservationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReservationModel(
      dateOfReservation: fields[1] as DateTime?,
      hoursOfReservation: fields[2] as int,
      courtId: fields[3] as int,
      courtName: fields[4] as String,
      courtImageUrl: fields[5] as String,
      userName: fields[6] as String,
      precipitationProbability: fields[7] as int,
      maxTemp: fields[8] as double?,
      minTemp: fields[9] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, ReservationModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(1)
      ..write(obj.dateOfReservation)
      ..writeByte(2)
      ..write(obj.hoursOfReservation)
      ..writeByte(3)
      ..write(obj.courtId)
      ..writeByte(4)
      ..write(obj.courtName)
      ..writeByte(5)
      ..write(obj.courtImageUrl)
      ..writeByte(6)
      ..write(obj.userName)
      ..writeByte(7)
      ..write(obj.precipitationProbability)
      ..writeByte(8)
      ..write(obj.maxTemp)
      ..writeByte(9)
      ..write(obj.minTemp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReservationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
