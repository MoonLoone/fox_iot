import 'dart:convert';

class FoxIoTRoom {
  final String name;
  final String homeId;
  final List<String> devices = List.empty(growable: false);
  final int id;

  FoxIoTRoom({required this.homeId, required this.id, required this.name});

  Map<String, dynamic> toMap() => {
        "houseId": homeId,
        "id": id,
        "name": name,
        "devices": json.encode(devices)
      };

  //todo devices
  factory FoxIoTRoom.fromMap(Map<String, dynamic> roomMap) => FoxIoTRoom(
      homeId: roomMap["houseId"], id: roomMap["id"], name: roomMap["name"]);

}
