import 'package:fox_iot/feature/devices/domain/models/Device.dart';

import '../../../../devices/domain/models/DeviceType.dart';

class BlueDevice extends Device {

  @override
  late String name;
  @override
  late DeviceType deviceType;

  BlueDevice({this.name = "", this.deviceType = DeviceType.undefined});

}
