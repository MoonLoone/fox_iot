import 'package:flutter/cupertino.dart';
import 'package:fox_iot/feature/devices/domain/models/Device.dart';
import 'package:fox_iot/feature/devices/domain/models/DeviceType.dart';
import 'package:fox_iot/feature/devices/presentation/bulb_screen/BulbPage.dart';
import 'package:fox_iot/feature/devices/presentation/camera_screen/CameraPage.dart';
import 'package:fox_iot/feature/devices/presentation/devices_list/devices_page.dart';
import 'package:fox_iot/feature/devices/presentation/hub_screen/HubPage.dart';
import 'package:fox_iot/feature/devices/presentation/motion_screen/MotionPage.dart';
import 'package:fox_iot/feature/devices/presentation/thermo_screen/ThermoPage.dart';
import 'package:fox_iot/res/values/assets.dart';

extension DevicePresentation on Device {
  FoxIotAssetName? getDeviceAssetName() {
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
}

Function() getFunctionToDeviceNavigate(Device device, BuildContext context) {
  switch (device.deviceType) {
    case DeviceType.hub:
      return () =>
          Navigator.pushNamed(context, HubPage.navId, arguments: device.id);
    case DeviceType.bulb:
      return () =>
          Navigator.pushNamed(context, BulbPage.navId, arguments: device.id);
    case DeviceType.thermal:
      return () =>
          Navigator.pushNamed(context, ThermoPage.navId, arguments: device.id);
    case DeviceType.motion:
      return () =>
          Navigator.pushNamed(context, MotionPage.navId, arguments: device.id);
    case DeviceType.camera:
      return () =>
          Navigator.pushNamed(context, CameraPage.navId, arguments: device.id);
    case DeviceType.unknown:
      return () => Navigator.pushNamed(context, DevicesPage.navId);
  }
}
