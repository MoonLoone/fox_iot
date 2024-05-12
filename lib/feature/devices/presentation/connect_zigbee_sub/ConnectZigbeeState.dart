import 'package:flutter/cupertino.dart';
import 'package:fox_iot/feature/devices/domain/models/Device.dart';
import 'package:fox_iot/feature/home/domain/FoxIoTRoom.dart';
import 'package:fox_iot/utils/models/LoadingState.dart';

@immutable
class ConnectZigbeeState {
  final LoadingState loading;
  final List<Device> gws;
  final Device? currentGW;
  final List<FoxIoTRoom> rooms;
  final FoxIoTRoom? currentRoom;

  const ConnectZigbeeState(
      {this.loading = const NotLoading(),
      this.gws = const [],
      this.currentRoom,
      this.currentGW,
      this.rooms = const []});

  ConnectZigbeeState updateState(
      {LoadingState? loading,
      List<Device>? gws,
      Device? currentGW,
      FoxIoTRoom? currentRoom,
      List<FoxIoTRoom>? rooms}) {
    return ConnectZigbeeState(
        loading: loading ?? this.loading,
        gws: gws ?? this.gws,
        currentGW: currentGW ?? this.currentGW,
        currentRoom: currentRoom ?? this.currentRoom,
        rooms: rooms ?? this.rooms);
  }
}
