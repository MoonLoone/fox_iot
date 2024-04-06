import 'package:fox_iot/feature/home/domain/FoxIoTHome.dart';
import 'package:fox_iot/feature/home/domain/FoxIoTRoom.dart';
import 'package:fox_iot/local_storage/domain/models/LocalHome.dart';
import 'package:fox_iot/local_storage/domain/models/LocalRoom.dart';

FoxIoTHome fromLocalHome(LocalHome home) {
  return FoxIoTHome(home.id, home.name,
      home.rooms.map((room) => fromLocalRoom(room)).toList());
}

FoxIoTRoom fromLocalRoom(LocalRoom localRoom) {
  return FoxIoTRoom(name: localRoom.name);
}

LocalHome fromDomainHome(FoxIoTHome home) {
  return LocalHome(
      id: home.id,
      name: home.name,
      rooms: home.rooms.map((room) => fromDomainRoom(room)).toList());
}

LocalRoom fromDomainRoom(FoxIoTRoom room) {
  return LocalRoom(name: room.name);
}
