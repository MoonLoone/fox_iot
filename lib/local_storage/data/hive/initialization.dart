import 'package:hive_flutter/adapters.dart';

import '../../domain/models/FoxIoTUser.dart';
import '../../domain/models/MainUserInfo.dart';

Future<void> initializeLocalStorage() async {
  await Hive.initFlutter();
  Hive.registerAdapter(FoxIoTUserAdapter());
  Hive.registerAdapter(MainUserInfoAdapter());
}
