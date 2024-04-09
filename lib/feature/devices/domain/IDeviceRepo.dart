import 'models/Device.dart';

abstract class IDeviceRepo {

  Future<List<Device>> getUserDevices();
  Future<List<Device>> getGWS();
  Future<String?> getToken();
  Future connectUsingAP(String token);
  Future connectZigbeeSub(String hubId);
  Future getThermalData(String deviceId);
  Future<bool> saveCameraUrl(String cameraUrl);

}
