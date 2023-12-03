import 'package:flutter_blue/flutter_blue.dart';
import 'package:fox_iot/feature/devices/domain/models/Device.dart';

import '../../../../devices/domain/models/DeviceType.dart';

class BlueDevice extends Device {
  @override
  late String name;
  @override
  late DeviceType deviceType;

  late BluetoothDevice bluetoothDevice;

  BlueDevice(this.bluetoothDevice,
      {this.name = "", this.deviceType = DeviceType.undefined});
}
