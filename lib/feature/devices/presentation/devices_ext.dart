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
    case DeviceType.sensor:
      return null;
    case DeviceType.camera:
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
  }
}

String getDeviceNameByType(BuildContext context, DeviceType deviceType) {
  switch (deviceType) {
    case DeviceType.hub:
      return S.of(context).hub;
    case DeviceType.bulb:
      return S.of(context).bulb;
    case DeviceType.sensor:
      return S.of(context).sensor;
    case DeviceType.camera:
      return S.of(context).camera;
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
  }
}
