import 'package:fox_iot/feature/devices/domain/models/Device.dart';
import 'package:fox_iot/feature/devices/domain/models/DeviceType.dart';
import 'package:fox_iot/res/values/assets.dart';

extension DevicePresentation on Device {
  FoxIotAssetName? getDeviceAssetName() {
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
}
