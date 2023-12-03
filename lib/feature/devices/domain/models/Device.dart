import 'DeviceType.dart';

class Device {
  late String name;
  late DeviceType deviceType;

  Device({this.name = "", this.deviceType = DeviceType.undefined});

  @override
  String toString() {
    return "name: $name, type: ${deviceType.name}";
  }
}
