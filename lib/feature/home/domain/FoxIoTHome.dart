


class FoxIoTHome {
  final int id;
  final String name;

  FoxIoTHome(this.id,this.name);

  factory FoxIoTHome.fromMap(Map<String, dynamic> map) {
    return FoxIoTHome(map["id"],map["name"]);
  }

  @override
  String toString() {
    return 'FoxIoTHome{name: $name}';
  }
}
