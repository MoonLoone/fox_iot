class FoxIoTRoom {
  final String name;

  FoxIoTRoom({required this.name});

  factory FoxIoTRoom.fromMap(Map<String, dynamic> map) {
    return FoxIoTRoom(name: map["rooms"]);
  }
}
