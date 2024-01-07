
import 'package:hive/hive.dart';

import '../../feature/auth/domain/models/FoxIoTUser.dart';

class FoxUserBox{

  static const String _userBoxName = 'user_box';
  static const String currentUser = 'current_user';

  Future<Box<FoxIoTUser>> box = Hive.openBox(_userBoxName);

}
