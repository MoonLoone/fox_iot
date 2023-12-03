import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fox_iot/feature/hardware_adapters/bluetooth/presentation/bluetooth_devices_bloc.dart';
import 'package:fox_iot/feature/hardware_adapters/bluetooth/presentation/components/loading_placeholder.dart';
import 'package:fox_iot/feature/hardware_adapters/bluetooth/presentation/contracts/bluetooth_devices_state.dart';
import 'package:fox_iot/res/components/fox_iot_buttons.dart';

import '../../../devices/presentation/components/device_list_item.dart';
import 'contracts/bluetooth_devices_actions.dart';

class BlueDevicesPage extends StatefulWidget {
  static const String navId = "search_blue_devices";

  const BlueDevicesPage({super.key});

  @override
  State<StatefulWidget> createState() => _BlueDevicesPageState();
}

class _BlueDevicesPageState extends State<BlueDevicesPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BluetoothDevicesBloc, BluetoothDevicesState>(
        builder: (context, state) {
      BluetoothDevicesBloc blocProvider =
          BlocProvider.of<BluetoothDevicesBloc>(context);
      return Scaffold(
        floatingActionButton: FoxIoTPrimaryButton(null, null, "Search",
            () => {blocProvider.add(ScanBluetoothDevices())}),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                flex: 5,
                child: LoadingPlaceholder(
                  loadingsState: state.loadingState,
                )),
            Expanded(
                flex: 5,
                child: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return DeviceListItem(state.blueDevices[index]);
                      },
                      itemCount: state.blueDevices.length,
                    )))
          ],
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<BluetoothDevicesBloc>(context).add(ScanBluetoothDevices());
  }
}
