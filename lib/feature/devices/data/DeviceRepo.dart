import 'dart:convert';

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
    final homeId = (await _homeDb.getCurrentHome())?.id;
    final String devicesString = await channel
        .invokeMethod("get_devices", {"home_id": homeId.toString()});
    final List<dynamic> devicesJson = jsonDecode(devicesString);
    return devicesJson.map((device) => Device.fromMap(device)).toList();
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
    return channel.invokeMethod("connect_using_ap", {
      "token": token,
      "home_id": homeId.toString(),
      "wifi_name": wifi,
      "wifi_password": password
    });
  }

  @override
  Future connectZigbeeSub(String hubId) {
    return channel.invokeMethod("connect_zigbee", {"hub_id": hubId});
  }

  @override
  Future<List<Device>> getGWS() async {
    final devices = await getUserDevices();
    return devices
        .where((element) => element.deviceType == DeviceType.hub)
        .toList();
  }

  @override
  Future getThermalData(String deviceId) async {
    return await channel
        .invokeMethod("get_device_data", {"devId": deviceId, "device_type": DeviceType.thermal.name});
  }

  @override
  Future<bool> saveCameraUrl(String cameraUrl) {
    // TODO: implement saveCameraUrl
    throw UnimplementedError();
  }

}
