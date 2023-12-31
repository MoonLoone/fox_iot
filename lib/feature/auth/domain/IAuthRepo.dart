
import 'package:fox_iot/feature/auth/domain/models/FoxIoTUser.dart';

abstract class IAuthRepo {

  Future<FoxIoTUser> createUser(String email, String password);

  Future<FoxIoTUser> authorize(String email, String password);

}
