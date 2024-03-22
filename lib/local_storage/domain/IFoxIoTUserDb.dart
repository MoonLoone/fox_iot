
import 'package:fox_iot/local_storage/domain/models/FoxIoTUser.dart';

abstract class IFoxIoTUserDb{
  Future<FoxIoTUser?>? getCurrentUser();
  Future<void>? replaceCurrentUser(FoxIoTUser newUser);
}
