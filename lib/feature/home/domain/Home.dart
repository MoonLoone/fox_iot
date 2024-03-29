import 'package:fox_iot/feature/home/domain/Room.dart';

class FoxIoTHome {
  final String name;
  final List<FoxIoTRoom> rooms;

  FoxIoTHome(this.name, this.rooms);

  factory FoxIoTHome.fromMap(Map<String, dynamic> map) {
    final rooms = List<FoxIoTRoom>.from(
        map["rooms"].map((item) => FoxIoTRoom.fromMap(item)));
    return FoxIoTHome(map["name"], rooms);
  }
}
