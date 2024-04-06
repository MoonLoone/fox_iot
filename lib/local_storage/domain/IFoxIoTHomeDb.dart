import 'models/LocalHome.dart';

abstract class IFoxIoTHomeDb {
  Future<LocalHome?> getCurrentHome();

  Future replaceCurrentHome(LocalHome home);
}
