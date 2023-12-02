import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fox_iot/feature/devices/presentation/components/device_list_item.dart';
import 'package:fox_iot/feature/devices/presentation/contracts/devices_actions.dart';
import 'package:fox_iot/feature/devices/presentation/contracts/devices_state.dart';
import 'package:fox_iot/feature/devices/presentation/devices_bloc.dart';
import 'package:fox_iot/res/components/background.dart';
import 'package:fox_iot/res/values/assets.dart';
import 'package:fox_iot/res/values/theme.dart';

import '../../../res/components/navbar/navbar.dart';
import '../../../res/components/navbar/navbar_states.dart';

class DevicesPage extends StatefulWidget {
  static const String navId = "devices_page";

  @override
  State<StatefulWidget> createState() => _DevicesPageState();
}

class _DevicesPageState extends State<DevicesPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DevicesBloc, DevicesState>(builder: (context, state) {
      return Background(
          child: Scaffold(
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
                        const Text("Add new device"),
                        Image.asset(FoxIotTheme
                                .assets[FoxIotAssetName.addDevice]?.url ??
                            FoxIotTheme.assets[FoxIotAssetName.undefined]!.url),
                      ]),
                ])),
            Expanded(
                flex: 5,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return DeviceListItem(state.devices[index]);
                  },
                  itemCount: state.devices.length,
                ))
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
