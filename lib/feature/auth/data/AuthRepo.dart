import 'package:firebase_auth/firebase_auth.dart';
import 'package:fox_iot/feature/auth/domain/IAuthRepo.dart';
import 'package:fox_iot/feature/auth/domain/models/FoxIoTUser.dart';

extension on UserCredential {
  AuthUserDTO toDomainModel() =>
      AuthUserDTO(name: user?.displayName ?? "", email: user?.email ?? "");
}

class AuthRepo extends IAuthRepo {

  late final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<AuthUserDTO> createUser(String email, String password) async {
    return (await _firebaseAuth
            .createUserWithEmailAndPassword(email: email, password: password))
            .toDomainModel();
  }

  @override
  Future<AuthUserDTO> authorizeWithEmail(String email, String password) async {
    return (await _firebaseAuth
            .signInWithEmailAndPassword(email: email, password: password))
            .toDomainModel();
  }

  @override
  Future<AuthUserDTO> authorizeWithGoogle() async {
    return AuthUserDTO(name: '', email: '');
  }

}
