import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fox_iot/feature/devices/domain/IDeviceRepo.dart';
import 'package:fox_iot/feature/devices/presentation/contracts/devices_actions.dart';
import 'package:fox_iot/feature/devices/presentation/contracts/devices_state.dart';
import 'package:get_it/get_it.dart';

class DevicesBloc extends Bloc<DevicesActions, DevicesState> {
  DevicesBloc() : super(const DevicesState()) {
    on((event, emit) {
      if (event is LoadDevices) {
        deviceRepo
            .getUserDevices()
            .then((value) => emit(state.updateState(devices: value)));
      }
    });
  }

  IDeviceRepo deviceRepo = GetIt.I.get<IDeviceRepo>();
}
