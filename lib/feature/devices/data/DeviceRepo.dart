import 'package:fox_iot/feature/devices/domain/IDeviceRepo.dart';
import 'package:fox_iot/feature/devices/domain/models/Device.dart';
import 'package:fox_iot/feature/devices/domain/models/DeviceType.dart';

class DeviceRepo extends IDeviceRepo {
  @override
  Future<List<Device>> getUserDevices() async {
    return [
      Device(name: "My Light Bulb", deviceType: DeviceType.bulb),
      Device(name: "My Light Bulb2", deviceType: DeviceType.bulb),
      Device(name: "My Hub", deviceType: DeviceType.hub),
      Device(name: "My Thermal Sensor", deviceType: DeviceType.sensor),
    ];
  }
}
