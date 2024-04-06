import 'DeviceType.dart';

class Device {
  late String name;
  late DeviceType deviceType;

  Device({this.name = "", required this.deviceType});

  @override
  String toString() {
    return "name: $name, type: ${deviceType.name}";
  }
}
