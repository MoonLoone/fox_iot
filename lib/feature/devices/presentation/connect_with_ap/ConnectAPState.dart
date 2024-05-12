import 'package:flutter/cupertino.dart';
import 'package:fox_iot/feature/home/domain/FoxIoTRoom.dart';

@immutable
class ConnectAPState {
  final String token;
  final String wifiName;
  final String wifiPassword;
  final FoxIoTRoom? currentRoom;
  final List<FoxIoTRoom> rooms;

  const ConnectAPState(
      {this.token = "",
      this.wifiName = "",
      this.wifiPassword = "",
      this.currentRoom,
      this.rooms = const []});

  ConnectAPState updateState(
          {String? token,
          String? wifiName,
          String? wifiPassword,
          FoxIoTRoom? currentRoom,
          List<FoxIoTRoom>? rooms}) =>
      ConnectAPState(
          token: token ?? this.token,
          wifiName: wifiName ?? this.wifiName,
          wifiPassword: wifiPassword ?? this.wifiPassword,
          rooms: rooms ?? this.rooms,
          currentRoom: currentRoom ?? this.currentRoom);
}

class InitialState extends ConnectAPState {}
