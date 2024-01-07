
import 'package:fox_iot/local_storage/models/MainUserInfo.dart';

class FoxIoTUser{

  final MainUserInfo mainUserInfo;
  final String id;

  FoxIoTUser(this.mainUserInfo, this.id);

  @override
  String toString() {
    return 'FoxIoTUser{name: $mainUserInfo, id: $id}';
  }

}
