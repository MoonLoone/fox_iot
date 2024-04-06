import 'package:fox_iot/feature/home/domain/FoxIoTHome.dart';

abstract class IHomeRepo {
  Future<List<FoxIoTHome>> getHouses();

  Future<bool> createHome(String? homeName, String? location);

  Future<bool> createRoom();

  Future<FoxIoTHome?> getSelectedHome();

}
