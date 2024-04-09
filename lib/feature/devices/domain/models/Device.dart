import '../../data/converters.dart';
import 'DeviceType.dart';

class Device {
  final String id;
  final String name;
  final DeviceType deviceType;

  Device({required this.id, required this.name, required this.deviceType});

  factory Device.fromMap(Map<String, dynamic> map) {
    return Device(
        id: map["id"],
        name: map["name"],
        deviceType: getTypeFromCategoryName(map["type"]));
  }

  @override
  String toString() {
    return "name: $name, type: ${deviceType.name}";
  }
}
