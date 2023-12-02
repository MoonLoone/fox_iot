import 'package:fox_iot/feature/devices/domain/IDeviceRepo.dart';
import 'package:fox_iot/feature/devices/domain/models/Device.dart';
import 'package:fox_iot/feature/devices/domain/models/DeviceType.dart';

class DeviceRepo extends IDeviceRepo {
  @override
  Future<List<Device>> getUserDevices() async {
    return [
      Device("My Light Bulb", DeviceType.bulb),
      Device("My Light Bulb2", DeviceType.bulb),
      Device("My Hub", DeviceType.hub),
      Device("My Thermal Sensor", DeviceType.sensor),
    ];
  }
}
