// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FoxIoTUser.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FoxIoTUserAdapter extends TypeAdapter<FoxIoTUser> {
  @override
  final int typeId = 1;

  @override
  FoxIoTUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FoxIoTUser(
      id: fields[1] as String,
      mainUserInfo: fields[0] as MainUserInfo,
    );
  }

  @override
  void write(BinaryWriter writer, FoxIoTUser obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.mainUserInfo)
      ..writeByte(1)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoxIoTUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
