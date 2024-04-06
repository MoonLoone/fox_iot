import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/services.dart';
import 'package:fox_iot/feature/home/data/converters.dart';
import 'package:fox_iot/feature/home/domain/FoxIoTHome.dart';
import 'package:fox_iot/feature/home/domain/IHomeRepo.dart';
import 'package:fox_iot/local_storage/domain/IFoxIoTHomeDb.dart';
import 'package:get_it/get_it.dart';

class HomeRepo extends IHomeRepo {
  static const MethodChannel channel = MethodChannel("fox_iot");
  final IFoxIoTHomeDb _homeDb = GetIt.I.get<IFoxIoTHomeDb>();

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
  Future<bool> createRoom() async {
    // TODO: implement createRoom
    throw UnimplementedError();
  }
}
