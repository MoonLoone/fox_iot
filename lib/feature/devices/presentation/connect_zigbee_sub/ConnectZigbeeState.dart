import 'package:flutter/cupertino.dart';
import 'package:fox_iot/feature/devices/domain/models/Device.dart';
import 'package:fox_iot/utils/models/LoadingState.dart';

@immutable
class ConnectZigbeeState {
  final LoadingState loading;
  final List<Device> gws;
  final Device? currentGW;

  const ConnectZigbeeState(
      {this.loading = const NotLoading(), this.gws = const [], this.currentGW});

  ConnectZigbeeState updateState(
      {LoadingState? loading, List<Device>? gws, Device? currentGW}) {
    return ConnectZigbeeState(
        loading: loading ?? this.loading,
        gws: gws ?? this.gws,
        currentGW: currentGW ?? this.currentGW);
  }
}
