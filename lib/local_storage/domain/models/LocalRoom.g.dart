// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LocalRoom.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalRoomAdapter extends TypeAdapter<LocalRoom> {
  @override
  final int typeId = 4;

  @override
  LocalRoom read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalRoom(
      name: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LocalRoom obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalRoomAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
