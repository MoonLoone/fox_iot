import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fox_iot/feature/devices/domain/models/Device.dart';
import 'package:fox_iot/feature/devices/domain/models/DeviceType.dart';
import 'package:fox_iot/feature/devices/presentation/connect_zigbee_sub/ConnectZigbeePage.dart';
import 'package:fox_iot/feature/devices/presentation/devices_ext.dart';
import 'package:fox_iot/feature/devices/presentation/devices_list/components/device_list_item.dart';
import 'package:fox_iot/feature/devices/presentation/get_token/GetTokenPage.dart';
import 'package:fox_iot/feature/devices/presentation/get_token/GetTokenState.dart';
import 'package:fox_iot/feature/devices/presentation/select_device_to_connect/components/DeviceConnectingTypeItem.dart';
import 'package:fox_iot/res/values/assets.dart';
import 'package:fox_iot/res/values/theme.dart';
import 'package:fox_iot/utils/AssetsManipulations.dart';

import '../../../../res/components/background.dart';
import '../../domain/models/DeviceConnectingType.dart';

class SelectDeviceToConnectPage extends StatelessWidget {
  static const String navId = "select_device_to_connect";
  final List<DeviceConnectingType> deviceTypes = DeviceConnectingType.values;

  @override
  Widget build(BuildContext context) {
    return Background(Scaffold(
        backgroundColor: Colors.amber.withOpacity(0),
        appBar: AppBar(
          title: Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                "Select device type",
                textAlign: TextAlign.center,
                style: FoxIotTheme.textStyles.h3,
              )),
          leading: InkWell(
              child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: SvgPicture.asset(
                    safetyGetAsset(FoxIotAssetName.backBtn).url,
                    width: 48,
                    height: 48,
                    color: Colors.black,
                  )),
              onTap: () => Navigator.pop(context)),
          centerTitle: true,
          backgroundColor: FoxIotTheme.colors.secondary,
        ),
        body: Center(
            child: SizedBox.expand(
                child: Center(
          child: ListView.builder(
              itemCount: deviceTypes.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: getFunctionForConnectingType(
                        deviceTypes[index], context),
                    child: DeviceConnectingTypeItem(deviceTypes[index]));
              }),
        )))));
  }
}

Function() getFunctionForConnectingType(
    DeviceConnectingType type, BuildContext context) {
  switch (type) {
    case DeviceConnectingType.cameraConnectUrl:
      return () => {};
    case DeviceConnectingType.hubConnectAP:
      return () =>
          Navigator.pushNamed(context, GetTokenPage.navId, arguments: type);
    case DeviceConnectingType.bulbConnectAP:
      return () =>
          Navigator.pushNamed(context, GetTokenPage.navId, arguments: type);
    case DeviceConnectingType.thermostatZigbee:
      return () => Navigator.pushNamed(context, ConnectZigbeePage.navId);
    case DeviceConnectingType.socketZigbee:
      return () => Navigator.pushNamed(context, ConnectZigbeePage.navId);
    case DeviceConnectingType.motionSensorZigbee:
      return () => Navigator.pushNamed(context, ConnectZigbeePage.navId);
  }
}
