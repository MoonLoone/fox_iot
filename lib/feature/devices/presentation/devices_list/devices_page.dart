import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fox_iot/feature/devices/presentation/devices_list/components/device_extension.dart';
import 'package:fox_iot/feature/devices/presentation/devices_list/devices_bloc.dart';
import 'package:fox_iot/feature/devices/presentation/select_device_to_connect/SelectDeviceToConnectPage.dart';
import 'package:fox_iot/res/components/background.dart';
import 'package:fox_iot/res/components/fox_iot_buttons.dart';
import 'package:fox_iot/res/values/assets.dart';
import 'package:fox_iot/res/values/theme.dart';

import '../../../../res/components/navbar/navbar.dart';
import '../../../../res/components/navbar/navbar_states.dart';
import '../../../../res/values/s.dart';
import 'components/device_list_item.dart';
import 'contracts/devices_actions.dart';
import 'contracts/devices_state.dart';

class DevicesPage extends StatelessWidget {
  static const String navId = "devices_page";

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
                child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                                FoxIotTheme
                                    .assets[FoxIotAssetName.undefined]!.url),
                            const SizedBox(
                              height: 32,
                            ),
                            FoxIoTPrimaryButton(
                                btnText: S.of(context).add_device,
                                onClick: () => Navigator.pushNamed(
                                    context, SelectDeviceToConnectPage.navId))
                          ]),
                    ])),
            Expanded(
                flex: 5,
                child: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: getFunctionToDeviceNavigate(state.devices[index], context),
                            child: DeviceListItem(state.devices[index]));
                      },
                      itemCount: state.devices.length,
                    )))
          ],
        ),
      ));
    });
  }
}
