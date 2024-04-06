import 'models/Device.dart';

abstract class IDeviceRepo {

  Future<List<Device>> getUserDevices();

  Future<String?> getToken();

  Future connectUsingAP(String token);

}
