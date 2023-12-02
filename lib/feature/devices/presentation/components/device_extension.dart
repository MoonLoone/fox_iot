
import 'package:fox_iot/feature/devices/domain/models/Device.dart';
import 'package:fox_iot/feature/devices/domain/models/DeviceType.dart';
import 'package:fox_iot/res/values/assets.dart';

extension DevicePresentation on Device{

  String getDeviceAssetName(){
    switch(deviceType){
      case DeviceType.hub: return FoxIotAssetName.hub.name;
      case DeviceType.bulb: return FoxIotAssetName.bulb.name;
      case DeviceType.sensor: return "";
    }
  }

}