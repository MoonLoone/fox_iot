import 'package:fox_iot/feature/devices/domain/models/Device.dart';
import 'package:fox_iot/feature/home/domain/FoxIoTHome.dart';
import 'package:fox_iot/feature/home/domain/FoxIoTRoom.dart';

import '../../../utils/models/Response.dart';

abstract class IHomeRepo {
  Future<List<FoxIoTHome>> getHouses();

  Future<bool> createHome(String? homeName, String? location);

  Future<Response> createRoom(String name, int id);

  Future<List<FoxIoTRoom>> getRooms();

  Future<FoxIoTHome?> getSelectedHome();

  Future<List<Device>> getRoomDevices(int roomId);

}
