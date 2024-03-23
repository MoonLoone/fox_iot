import 'package:fox_iot/feature/auth/domain/models/FoxIoTUser.dart';
import 'package:fox_iot/local_storage/domain/models/FoxIoTUser.dart';
import 'package:fox_iot/local_storage/domain/models/MainUserInfo.dart';

import '../../../utils/models/Response.dart';

abstract class IAuthRepo {
  Future<Response<AuthUserDTO>> createAuthUser(String email, String password);

  Future<Response<bool>> sendMainUserInfo(String userId, MainUserInfo mainUserInfo);

  Future<Response<AuthUserDTO>> authorizeWithEmailAndPassword(
      String email, String password, Function() onSuccessCallback);

  Future<Response<AuthUserDTO>> authorizeWithGoogle(
      Function() onSuccessCallback);

  Future<Response<bool>> logout();
}
