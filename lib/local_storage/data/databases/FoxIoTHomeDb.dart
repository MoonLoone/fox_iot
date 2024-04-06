import 'package:fox_iot/feature/home/domain/FoxIoTHome.dart';
import 'package:fox_iot/local_storage/domain/IFoxIoTHomeDb.dart';
import 'package:fox_iot/local_storage/domain/models/LocalHome.dart';
import 'package:hive/hive.dart';

import '../hive/BoxesStorage.dart';

class FoxIoTHomeDb extends IFoxIoTHomeDb {
  Future<Box<LocalHome>> dbImpl =
  Hive.openBox<LocalHome>(BoxesStorage.homeBoxName);

  @override
  Future<LocalHome?> getCurrentHome() {
    return dbImpl.then((value) => value.get(BoxesStorage.currentHome));
  }

  @override
  Future replaceCurrentHome(LocalHome home) {
    return dbImpl.then((value) {
      value.clear();
      value.put(BoxesStorage.currentHome, home);
      return value.add(home);
    });
  }
}
