import 'models/Device.dart';

abstract class IDeviceRepo {
  Future<List<Device>> getUserDevices();
}
