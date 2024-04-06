import 'package:flutter/services.dart';
import 'package:fox_iot/feature/devices/domain/IDeviceRepo.dart';
import 'package:fox_iot/feature/devices/domain/models/Device.dart';
import 'package:fox_iot/feature/devices/domain/models/DeviceType.dart';
import 'package:get_it/get_it.dart';

import '../../../local_storage/domain/IFoxIoTHomeDb.dart';

class DeviceRepo extends IDeviceRepo {
  static const MethodChannel channel = MethodChannel("fox_iot");
  final IFoxIoTHomeDb _homeDb = GetIt.I.get<IFoxIoTHomeDb>();

  @override
  Future<List<Device>> getUserDevices() async {
    return [
      Device(name: "My Light Bulb", deviceType: DeviceType.bulb),
      Device(name: "My Light Bulb2", deviceType: DeviceType.bulb),
      Device(name: "My Hub", deviceType: DeviceType.hub),
      Device(name: "My Thermal Sensor", deviceType: DeviceType.sensor),
    ];
  }

  @override
  Future<String?> getToken() async {
    final home = await _homeDb.getCurrentHome();
    return channel.invokeMethod("get_token", {"home_id": home?.id.toString()});
  }

  @override
  Future connectUsingAP(String token) async {
    final homeId = (await _homeDb.getCurrentHome())?.id;
    final wifi = "MTS_GPON_8f91c0";
    final password = "19661966";
    print("Token in repo "+ token);
    return channel.invokeMethod("connect_using_ap", {
      "token": token,
      "home_id": homeId.toString(),
      "wifi_name": wifi,
      "wifi_password": password
    });
  }
}
