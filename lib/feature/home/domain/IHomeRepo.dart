import 'package:fox_iot/feature/home/domain/Home.dart';

abstract class IHomeRepo {
  Future<List<FoxIoTHome>> getHouses();

  Future<bool> createHome();

  Future<bool> createRoom();

  Future<FoxIoTHome> getSelectedHome();
}
