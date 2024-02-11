
import 'package:fox_iot/feature/auth/domain/models/FoxIoTUser.dart';

abstract class IAuthRepo {

  Future<AuthUserDTO> createUser(String email, String password);

  Future<AuthUserDTO> authorize(String email, String password);

}
