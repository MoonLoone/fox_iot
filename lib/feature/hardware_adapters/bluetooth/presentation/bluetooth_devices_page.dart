import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fox_iot/feature/hardware_adapters/bluetooth/presentation/bluetooth_devices_bloc.dart';
import 'package:fox_iot/feature/hardware_adapters/bluetooth/presentation/components/loading_placeholder.dart';
import 'package:fox_iot/feature/hardware_adapters/bluetooth/presentation/contracts/bluetooth_devices_state.dart';
import 'package:fox_iot/res/components/fox_iot_buttons.dart';
import 'package:fox_iot/res/values/theme.dart';

import '../../../../res/values/s.dart';
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
        floatingActionButton: FoxIoTPrimaryButton(
            null,
            null,
            S.of(context).search,
            () => {blocProvider.add(ScanBluetoothDevices())}),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                flex: 5,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).search_for_devices,
                        style: FoxIotTheme.textStyles.h4,
                      ),
                      LoadingPlaceholder(
                        loadingsState: state.loadingState,
                      )
                    ])),
            Expanded(
                flex: 5,
                child: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Center(
                        child: ListView.builder(
                      itemBuilder: (context, index) {
                        return DeviceListItem(state.blueDevices[index]);
                      },
                      itemCount: state.blueDevices.length,
                    ))))
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
