import 'package:flutter/services.dart';
import 'package:fox_iot/feature/home/domain/Home.dart';
import 'package:fox_iot/feature/home/domain/IHomeRepo.dart';

class HomeRepo extends IHomeRepo {
  static const MethodChannel channel = MethodChannel("fox_iot");

  @override
  Future<List<FoxIoTHome>> getHouses() async {
    final List<dynamic> housesList = await channel.invokeMethod("getHouses");
    return housesList.map((house) => FoxIoTHome.fromMap(house)).toList();
  }

  @override
  Future<FoxIoTHome> getSelectedHome() async {
    // TODO: implement getSelectedHome
    throw UnimplementedError();
  }

  @override
  Future<bool> createHome() async {
    return channel.invokeMethod("createHome").then<bool>((value) => value);
  }

  @override
  Future<bool> createRoom() async {
    // TODO: implement createRoom
    throw UnimplementedError();
  }
}
