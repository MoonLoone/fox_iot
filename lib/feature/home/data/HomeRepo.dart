import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
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
      _homeDb.replaceCurrentHome(fromDomainHome(houses.first));
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
  Future<Response> createRoom(String name, int id, String homeId) =>
      safeApiRequest(() {
        return _firebaseFirestore
            .collection("rooms")
            .add(FoxIoTRoom(name: name, id: id, homeId: homeId).toMap())
            .whenComplete(() => {});
      });

  @override
  Future<Response<List<FoxIoTRoom>>> getRooms(String homeId) =>
      safeApiRequest(() {
        return _firebaseFirestore
            .collection("rooms")
            .where("houseId", isEqualTo: homeId)
            .get()
            .then((value) {
          return value.docs.map((e) => FoxIoTRoom.fromMap(e.data())).toList();
        });
      });

}
