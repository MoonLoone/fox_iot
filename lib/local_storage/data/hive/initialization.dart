import 'package:fox_iot/local_storage/domain/models/LocalHome.dart';
import 'package:fox_iot/local_storage/domain/models/LocalRoom.dart';
import 'package:hive_flutter/adapters.dart';

import '../../domain/models/FoxIoTUser.dart';
import '../../domain/models/MainUserInfo.dart';

Future<void> initializeLocalStorage() async {
  await Hive.initFlutter();
  Hive.registerAdapter(FoxIoTUserAdapter());
  Hive.registerAdapter(MainUserInfoAdapter());
  Hive.registerAdapter(LocalHomeAdapter());
  Hive.registerAdapter(LocalRoomAdapter());
}
