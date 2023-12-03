import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fox_iot/feature/devices/presentation/components/device_list_item.dart';
import 'package:fox_iot/feature/devices/presentation/contracts/devices_actions.dart';
import 'package:fox_iot/feature/devices/presentation/contracts/devices_state.dart';
import 'package:fox_iot/feature/devices/presentation/devices_bloc.dart';
import 'package:fox_iot/feature/hardware_adapters/bluetooth/presentation/bluetooth_devices_page.dart';
import 'package:fox_iot/res/components/background.dart';
import 'package:fox_iot/res/components/fox_iot_buttons.dart';
import 'package:fox_iot/res/values/assets.dart';
import 'package:fox_iot/res/values/theme.dart';

import '../../../res/components/navbar/navbar.dart';
import '../../../res/components/navbar/navbar_states.dart';
import '../../../res/values/s.dart';

class DevicesPage extends StatefulWidget {
  static const String navId = "devices_page";

  const DevicesPage({super.key});

  @override
  State<StatefulWidget> createState() => _DevicesPageState();
}

class _DevicesPageState extends State<DevicesPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DevicesBloc, DevicesState>(builder: (context, state) {
      return Background(Scaffold(
        backgroundColor: Colors.amber.withOpacity(0),
        bottomNavigationBar: FoxNavbar(
          NavbarStates.devices,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                flex: 6,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          S.of(context).add_device,
                          style: FoxIotTheme.textStyles.h4,
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Image.asset(FoxIotTheme
                                .assets[FoxIotAssetName.addDevice]?.url ??
                            FoxIotTheme.assets[FoxIotAssetName.undefined]!.url),
                        const SizedBox(
                          height: 32,
                        ),
                        FoxIoTPrimaryButton(
                            null,
                            null,
                            S.of(context).add_device,
                            () => Navigator.pushNamed(
                                context, BlueDevicesPage.navId))
                      ]),
                ])),
            Expanded(
                flex: 5,
                child: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return DeviceListItem(state.devices[index]);
                      },
                      itemCount: state.devices.length,
                    )))
          ],
        ),
      ));
    });
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<DevicesBloc>(context).add(LoadDevices());
  }
}
