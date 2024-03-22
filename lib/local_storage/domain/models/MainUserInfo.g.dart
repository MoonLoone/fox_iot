// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MainUserInfo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MainUserInfoAdapter extends TypeAdapter<MainUserInfo> {
  @override
  final int typeId = 2;

  @override
  MainUserInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MainUserInfo(
      firstName: fields[0] as String,
      lastName: fields[1] as String?,
      bio: fields[2] as String?,
      avatarUrl: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MainUserInfo obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.firstName)
      ..writeByte(1)
      ..write(obj.lastName)
      ..writeByte(2)
      ..write(obj.bio)
      ..writeByte(3)
      ..write(obj.avatarUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MainUserInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
