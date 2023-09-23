import 'package:fox_iot/auth/domain/IAuthRepo.dart';

class AuthRepo extends IAuthRepo {

  @override
  Future<bool> createUser(String email, String password) {
    return Future(() => true);
  }

}
