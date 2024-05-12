import 'package:fox_iot/feature/devices/domain/IBulbManagement.dart';

import 'models/Device.dart';

abstract class IDeviceRepo extends IBulbManagement {
  Future<List<Device>> getUserDevices();

  Future<List<Device>> getGWS();

  Future<String?> getToken();

  Future connectUsingAP(
      String token, String wifiPassword, String wifiName, int? roomId);

  Future connectZigbeeSub(String hubId, int? roomId);

  Future getThermalData(String deviceId);

  Future saveCameraUrl(String cameraUrl);

  Future<List<Device>> getCameras();
}
