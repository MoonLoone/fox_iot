
import 'package:hive/hive.dart';

import '../../data/hive/BoxesStorage.dart';
import 'MainUserInfo.dart';
part 'FoxIoTUser.g.dart';

/** Изменения необходимо вносить также в UserAdapter **/
@HiveType(typeId: BoxesStorage.userAdapterId)
class FoxIoTUser{

  @HiveField(0)
  final MainUserInfo mainUserInfo;
  @HiveField(1)
  final String id;

  FoxIoTUser({required this.id, required this.mainUserInfo});

  @override
  String toString() {
    return 'FoxIoTUser{name: $mainUserInfo, id: $id}';
  }

}
