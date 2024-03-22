import 'package:fox_iot/local_storage/domain/IFoxIoTUserDb.dart';
import 'package:hive/hive.dart';

import '../../domain/models/FoxIoTUser.dart';
import '../hive/BoxesStorage.dart';

class FoxIoTUserDb extends IFoxIoTUserDb {
  Future<Box<FoxIoTUser>>? dbImpl =
      Hive.openBox<FoxIoTUser>(BoxesStorage.userBoxName);

  @override
  Future<FoxIoTUser?>? getCurrentUser() {
    return dbImpl?.then((value) {
          if (value.isEmpty) {
            return null;
          } else {
            return value.getAt(0);
          }
        });
  }

  @override
  Future<void>? replaceCurrentUser(FoxIoTUser newUser) {
    return dbImpl?.then((value){
      value.clear();
      value.add(newUser);
    });
  }
}
