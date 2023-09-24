import 'package:firebase_auth/firebase_auth.dart';
import 'package:fox_iot/auth/domain/IAuthRepo.dart';
import 'package:fox_iot/auth/domain/models/FoxIoTUser.dart';

extension on UserCredential {
  FoxIoTUser toDomainModel() =>
      FoxIoTUser(name: user?.displayName ?? "", email: user?.email ?? "");
}

class AuthRepo extends IAuthRepo {
  @override
  Future<FoxIoTUser> createUser(String email, String password) async {
    return (await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password))
        .toDomainModel();
  }

  @override
  Future<FoxIoTUser> authorize(String email, String password) async {
    return (await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password))
        .toDomainModel();
  }
}
