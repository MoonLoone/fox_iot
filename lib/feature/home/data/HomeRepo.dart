import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fox_iot/feature/home/domain/FoxIoTHome.dart';
import 'package:fox_iot/feature/home/domain/IHomeRepo.dart';

class HomeRepo extends IHomeRepo {
  static const MethodChannel channel = MethodChannel("fox_iot");

  @override
  Future<List<FoxIoTHome>> getHouses() async {
    final String housesListFromNative = await channel.invokeMethod("get_homes");
    final List<dynamic> housesJson = jsonDecode(housesListFromNative);
    return  housesJson.map((house) => FoxIoTHome.fromMap(house)).toList();
  }

  @override
  Future<FoxIoTHome> getSelectedHome() async {
    // TODO: implement getSelectedHome
    throw UnimplementedError();
  }

  @override
  Future<bool> createHome(String? homeName, String? location) async {
    return channel.invokeMethod("createHome", {"homeName": homeName, "location": location}).then<bool>((value) => value);
  }

  @override
  Future<bool> createRoom() async {
    // TODO: implement createRoom
    throw UnimplementedError();
  }
}
