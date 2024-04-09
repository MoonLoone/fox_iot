import 'package:flutter/cupertino.dart';
import 'package:fox_iot/feature/devices/domain/models/DeviceType.dart';
import 'package:fox_iot/feature/devices/presentation/select_device_to_connect/components/DeviceConnectingTypeItem.dart';
import 'package:fox_iot/res/values/assets.dart';

import '../../../res/values/s.dart';
import '../domain/models/DeviceConnectingType.dart';

FoxIotAssetName? getDeviceAssetName(DeviceType deviceType) {
  switch (deviceType) {
    case DeviceType.hub:
      return FoxIotAssetName.hub;
    case DeviceType.bulb:
      return FoxIotAssetName.bulb;
    case DeviceType.camera:
      return null;
    case DeviceType.unknown:
      return FoxIotAssetName.undefined;
    case DeviceType.thermal:
      return null;
    case DeviceType.motion:
      return null;
  }
}

FoxIotAssetName? getConnectType(DeviceConnectingType deviceConnectingTypeItem) {
  switch (deviceConnectingTypeItem) {
    case DeviceConnectingType.hubConnectAP:
      return FoxIotAssetName.hub;
    case DeviceConnectingType.bulbConnectAP:
      return FoxIotAssetName.bulb;
    case DeviceConnectingType.cameraConnectUrl:
      return null;
    case DeviceConnectingType.thermostatZigbee:
      return null;
    case DeviceConnectingType.socketZigbee:
      return null;
    case DeviceConnectingType.motionSensorZigbee:
      return null;
  }
}

String getDeviceNameByType(BuildContext context, DeviceType deviceType) {
  switch (deviceType) {
    case DeviceType.hub:
      return S.of(context).hub;
    case DeviceType.bulb:
      return S.of(context).bulb;
    case DeviceType.camera:
      return S.of(context).camera;
    case DeviceType.unknown:
      return "Unknown";
    case DeviceType.thermal:
      return "Thermal";
    case DeviceType.motion:
      return "Motion";
  }
}

String getConnectDeviceName(
    BuildContext context, DeviceConnectingType deviceType) {
  switch (deviceType) {
    case DeviceConnectingType.cameraConnectUrl:
      return S.of(context).camera;
    case DeviceConnectingType.hubConnectAP:
      return S.of(context).hub;
    case DeviceConnectingType.bulbConnectAP:
      return S.of(context).bulb;
    case DeviceConnectingType.thermostatZigbee:
      return "Zigbee";
    case DeviceConnectingType.socketZigbee:
      return "Zigbee";
    case DeviceConnectingType.motionSensorZigbee:
      return "Zigbee";
  }
}

String getConnectDeviceDescription(
    BuildContext context, DeviceConnectingType deviceType) {
  switch (deviceType) {
    case DeviceConnectingType.cameraConnectUrl:
      return "Connect using URL";
    case DeviceConnectingType.hubConnectAP:
      return "Connect using AP";
    case DeviceConnectingType.bulbConnectAP:
      return "Connect using AP";
    case DeviceConnectingType.thermostatZigbee:
      return "Connect with zigbee hub";
    case DeviceConnectingType.socketZigbee:
      return "Connect with zigbee hub";
    case DeviceConnectingType.motionSensorZigbee:
      return "Connect with zigbee hub";
  }
}
