import 'package:flutter/services.dart';
import 'package:fox_iot/local_storage/domain/IFoxIoTUserDb.dart';
import 'package:hive/hive.dart';

import '../../domain/models/FoxIoTUser.dart';
import '../hive/BoxesStorage.dart';

class FoxIoTUserDb extends IFoxIoTUserDb {

  Future<Box<FoxIoTUser>>? dbImpl =
      Hive.openBox<FoxIoTUser>(BoxesStorage.userBoxName);
  static const MethodChannel _channel = MethodChannel("fox_iot");

  @override
  Future<FoxIoTUser?>? getCurrentUser() {
    _channel.invokeMethod("verify_user");
    return dbImpl?.then((value) {
          if (value.isEmpty) {
            return null;
          } else {
            return value.getAt(0);
          }
        });
  }

  @override
  Future<void>? replaceCurrentUser(FoxIoTUser? newUser) {
    return dbImpl?.then((value){
      value.clear();
      if (newUser != null) {
        value.add(newUser);
      }
    });
  }
}
