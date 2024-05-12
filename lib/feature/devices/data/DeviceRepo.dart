import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:fox_iot/feature/devices/domain/IDeviceRepo.dart';
import 'package:fox_iot/feature/devices/domain/models/Device.dart';
import 'package:fox_iot/feature/devices/domain/models/DeviceType.dart';
import 'package:fox_iot/utils/models/Response.dart';
import 'package:fox_iot/utils/safe_operations.dart';
import 'package:get_it/get_it.dart';

import '../../../local_storage/domain/IFoxIoTHomeDb.dart';
import '../../../local_storage/domain/IFoxIoTUserDb.dart';
import '../domain/models/BulbHSVColor.dart';

class DeviceRepo extends IDeviceRepo {
  static const MethodChannel channel = MethodChannel("fox_iot");
  final IFoxIoTHomeDb _homeDb = GetIt.I.get<IFoxIoTHomeDb>();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final IFoxIoTUserDb _userDb = GetIt.I.get<IFoxIoTUserDb>();

  @override
  Future<List<Device>> getUserDevices() async {
    _userDb.getCurrentUser();
    final cameras = await getCameras();
    final homeId = (await _homeDb.getCurrentHome())?.id;
    final String devicesString = await channel
        .invokeMethod("get_devices", {"home_id": homeId.toString()});
    final List<dynamic> devicesJson = jsonDecode(devicesString);
    final devices =
        devicesJson.map((device) => Device.fromMap(device)).toList();
    return devices + cameras;
  }

  @override
  Future<String?> getToken() async {
    _userDb.getCurrentUser();
    final home = await _homeDb.getCurrentHome();
    return channel.invokeMethod("get_token", {"home_id": home?.id.toString()});
  }

  @override
  Future connectUsingAP(
      String token, String wifiPassword, String wifiName, int? roomId) async {
    _userDb.getCurrentUser();
    final homeId = (await _homeDb.getCurrentHome())?.id;
    return safeApiRequest(() => channel.invokeMethod("connect_using_ap", {
          "token": token,
          "home_id": homeId.toString(),
          "wifi_name": wifiName,
          "wifi_password": wifiPassword
        })).then((value) async {
      if (value is SuccessResponse && roomId != null) {
        var roomSnap = await _firebaseFirestore
            .collection("rooms")
            .where("id", isEqualTo: roomId)
            .limit(1)
            .get();
        var room = roomSnap.docs.first;
        room.reference.update({
          "devices":
              FieldValue.arrayUnion([(value as SuccessResponse<String>).data])
        });
      }
      return value;
    });
  }

  @override
  Future connectZigbeeSub(String hubId, int? roomId) {
    _userDb.getCurrentUser();
    return channel.invokeMethod("connect_zigbee", {"hub_id": hubId});
  }

  @override
  Future<List<Device>> getGWS() async {
    _userDb.getCurrentUser();
    final devices = await getUserDevices();
    return devices
        .where((element) => element.deviceType == DeviceType.hub)
        .toList();
  }

  @override
  Future getThermalData(String deviceId) async {
    _userDb.getCurrentUser();
    return await channel.invokeMethod("get_device_data",
        {"devId": deviceId, "device_type": DeviceType.thermal.name});
  }

  @override
  Future saveCameraUrl(String cameraUrl) async {
    _userDb.getCurrentUser();
    String userId = (await _userDb.getCurrentUser())!.id;
    _firebaseFirestore
        .collection("cameras")
        .add({"url": cameraUrl, "userId": userId});
  }

  @override
  Future<List<Device>> getCameras() async {
    String userId = (await _userDb.getCurrentUser())!.id;
    final requestResult = await _firebaseFirestore
        .collection("cameras")
        .where("userId", isEqualTo: userId)
        .get();
    return mapFromDoc(requestResult.docs);
  }

  List<Device> mapFromDoc(
      List<QueryDocumentSnapshot<Map<String, dynamic>>> dataToMap) {
    return dataToMap
        .map((element) => Device(
            id: element.data()["url"],
            name: element.id,
            deviceType: DeviceType.camera))
        .toList();
  }

  @override
  Future changeBulbColor(String bulbId, BulbHSVColor color) async {
    _userDb.getCurrentUser();
    String bulbColorMap = jsonEncode(color.toMap());
    await channel.invokeMethod(
        "on_off_bulb", {"bulb_id": bulbId, "color_data": bulbColorMap});
  }

  @override
  Future<bool> onOffBulb(String bulbId, bool newState) async {
    _userDb.getCurrentUser();
    final String result = await channel.invokeMethod("on_off_bulb",
        {"bulb_id": bulbId, "new_bulb_state": newState.toString()});
    return result == "true";
  }
}
