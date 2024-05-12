import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:fox_iot/feature/devices/domain/IDeviceRepo.dart';
import 'package:fox_iot/feature/devices/domain/models/Device.dart';
import 'package:fox_iot/feature/home/data/converters.dart';
import 'package:fox_iot/feature/home/domain/FoxIoTHome.dart';
import 'package:fox_iot/feature/home/domain/FoxIoTRoom.dart';
import 'package:fox_iot/feature/home/domain/IHomeRepo.dart';
import 'package:fox_iot/local_storage/domain/IFoxIoTHomeDb.dart';
import 'package:fox_iot/utils/safe_operations.dart';
import 'package:get_it/get_it.dart';
import '../../../utils/models/Response.dart';

class HomeRepo extends IHomeRepo {
  static const MethodChannel channel = MethodChannel("fox_iot");
  final IFoxIoTHomeDb _homeDb = GetIt.I.get<IFoxIoTHomeDb>();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final IDeviceRepo _deviceRepo = GetIt.I.get<IDeviceRepo>();

  @override
  Future<List<FoxIoTHome>> getHouses() async {
    final String housesListFromNative = await channel.invokeMethod("get_homes");
    final List<dynamic> housesJson = jsonDecode(housesListFromNative);
    return housesJson.map((house) => FoxIoTHome.fromMap(house)).toList();
  }

  @override
  Future<FoxIoTHome?> getSelectedHome() async {
    final localHome = await _homeDb.getCurrentHome();
    if (localHome == null) {
      final houses = await getHouses();
      await _homeDb.replaceCurrentHome(fromDomainHome(houses.first));
      return await _homeDb.getCurrentHome().then((value) {
        if (value == null) return null;
        return fromLocalHome(value);
      });
    }
    return fromLocalHome(localHome);
  }

  @override
  Future<bool> createHome(String? homeName, String? location) async {
    return channel.invokeMethod("createHome", {
      "homeName": homeName,
      "location": location
    }).then<bool>((value) => value);
  }

  @override
  Future<Response> createRoom(String name, int id) => safeApiRequest(() {
        final currentHome = _homeDb.getCurrentHome();
        return currentHome.then((curHome) => _firebaseFirestore
            .collection("rooms")
            .add(FoxIoTRoom(name: name, id: id, homeId: curHome!.id.toString()).toMap())
            .whenComplete(() => {}));
      });

  @override
  Future<List<FoxIoTRoom>> getRooms() async {
    final currentHome = await _homeDb.getCurrentHome();
    if (currentHome == null) return List.empty();
    return _firebaseFirestore
        .collection("rooms")
        .where("houseId", isEqualTo: currentHome.id.toString())
        .get()
        .then((value) {
      return value.docs.map((e) => FoxIoTRoom.fromMap(e.data())).toList();
    });
  }

  @override
  Future<List<Device>> getRoomDevices(int roomId) async {
    final room = await _firebaseFirestore
        .collection("rooms")
        .where("id", isEqualTo: roomId)
        .get()
        .then((value) {
      return FoxIoTRoom.fromMap(value.docs.first.data());
    });
    return await _deviceRepo.getUserDevices().then((value) => value
        .where((element) => room.devices
            .where((roomDeviceName) => roomDeviceName == element.name)
            .isNotEmpty)
        .toList());
  }
}
