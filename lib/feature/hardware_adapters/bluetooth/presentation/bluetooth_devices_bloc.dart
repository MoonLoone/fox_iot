import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fox_iot/feature/hardware_adapters/bluetooth/domain/IBluetooth.dart';
import 'package:fox_iot/feature/hardware_adapters/bluetooth/presentation/contracts/bluetooth_devices_actions.dart';
import 'package:fox_iot/feature/hardware_adapters/bluetooth/presentation/contracts/bluetooth_devices_state.dart';
import 'package:fox_iot/utils/models/LoadingState.dart';
import 'package:get_it/get_it.dart';

class BluetoothDevicesBloc
    extends Bloc<BluetoothDevicesActions, BluetoothDevicesState> {
  BluetoothDevicesBloc() : super(const BluetoothDevicesState()) {
    on((event, emit) async {
      emit(state.updateState(loadingState: LoadingState.loading));
      if (event is ScanBluetoothDevices) {
        await _bluetooth.getAllBluetoothDevices().then((value) => emit(
            state.updateState(
                blueDevices: value, loadingState: LoadingState.notLoading)));
      }
    });
  }

  final IBluetooth _bluetooth = GetIt.I.get<IBluetooth>();
}
