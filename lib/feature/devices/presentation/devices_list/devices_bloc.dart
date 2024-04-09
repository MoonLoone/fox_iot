import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fox_iot/feature/devices/domain/IDeviceRepo.dart';
import 'package:fox_iot/utils/IFoxIoTActions.dart';
import 'package:get_it/get_it.dart';

import 'contracts/devices_actions.dart';
import 'contracts/devices_state.dart';

class DevicesBloc extends Bloc<IFoxIoTActions, DevicesState> {
  DevicesBloc() : super(const DevicesState()) {
    on<OnInit>((event, emit) async {
      await deviceRepo
          .getUserDevices()
          .then((value){
            emit(state.updateState(devices: value));
      });
    });
  }

  IDeviceRepo deviceRepo = GetIt.I.get<IDeviceRepo>();
}
