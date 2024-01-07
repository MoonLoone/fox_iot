import 'package:flutter/cupertino.dart';

import '../../../../utils/models/LoadingState.dart';
import '../../domain/models/Device.dart';

@immutable
class DevicesState {
  final LoadingState loadingState;
  final List<Device> devices;

  const DevicesState(
      {this.loadingState = LoadingState.notLoading, this.devices = const []});

  DevicesState updateState(
      {LoadingState? loadingState, List<Device>? devices}) {
    return DevicesState(
        loadingState: loadingState ?? this.loadingState,
        devices: devices ?? this.devices);
  }
}

