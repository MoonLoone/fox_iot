import 'package:fox_iot/local_storage/models/MainUserInfo.dart';
import 'package:hive_flutter/adapters.dart';

import '../models/FoxIoTUser.dart';

Future<void> initializeLocalStorage() async {
  await Hive.initFlutter();
  Hive.registerAdapter(FoxIoTUserAdapter());
  Hive.registerAdapter(MainUserInfoAdapter());
}
