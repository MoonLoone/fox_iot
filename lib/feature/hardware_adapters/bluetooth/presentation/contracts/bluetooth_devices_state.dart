import 'package:flutter/cupertino.dart';
import 'package:fox_iot/utils/models/LoadingState.dart';

import '../../domain/models/bluetooth_device.dart';

@immutable
class BluetoothDevicesState {
  final List<BlueDevice> blueDevices;
  final LoadingState loadingState;

  const BluetoothDevicesState(
      {this.blueDevices = const [], this.loadingState = const Loading()});

  BluetoothDevicesState updateState({
    List<BlueDevice>? blueDevices,
    LoadingState? loadingState,
  }) =>
      BluetoothDevicesState(
          loadingState: loadingState ?? this.loadingState,
          blueDevices: blueDevices ?? this.blueDevices);
}
