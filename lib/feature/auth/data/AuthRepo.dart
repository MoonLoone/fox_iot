import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fox_iot/feature/auth/domain/IAuthRepo.dart';
import 'package:fox_iot/feature/auth/domain/models/FoxIoTUser.dart';

extension on UserCredential {
  AuthUserDTO toDomainModel() =>
      AuthUserDTO(name: user?.displayName ?? "", email: user?.email ?? "");
}

class AuthRepo extends IAuthRepo {
  final String authUrl = "https://openapi.tuyaeu.com/v1.0/token?grantType=1";

  /* String calcSign(String clientId, String timestamp, String nonce, String signStr, String secret) {
    var str = clientId + timestamp + nonce + signStr;
    //var key = utf8.encode(secret);
    var bytes = utf8.encode(str);
    List<int> key = base64.decode(secret);
    //var hmacSha256 = Hmac(sha256, key);
    var hmacSha256 = Hmac(sha256, key);
    var digest = hmacSha256.convert(bytes);
    return digest.toString().toUpperCase();
  }*/

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<AuthUserDTO> createUser(String email, String password) async {
    log(email + password);
    return _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
          log(value.toString());
          return value.toDomainModel();
        })
        .timeout(const Duration(seconds: 20))
        .catchError((e) {
          log(e.toString());
        });
  }

  /*@override
  void createUser() async {
    String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    String clientId = "mpcvcxe8uaex39rckn7m";
    String secret = "b9632c233f9444caa0d147cab996529b";
    Map<String, String> headers = {
      't': timestamp,
      "sign_method": "HMAC-SHA256",
      "client_id": clientId,
      "sign": calcSign(clientId, timestamp, "", "", secret)
    };
    log(calcSign(clientId, timestamp, "", "", secret));
    Response response = await http.get(Uri.parse(authUrl), headers: headers);
    log(response.body);
    log(response.request.toString());
  }*/

  @override
  Future<AuthUserDTO> authorizeWithEmail(String email, String password) async {
    return (await _firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password))
        .toDomainModel();
  }

  @override
  Future<AuthUserDTO> authorizeWithGoogle() async {
    return AuthUserDTO(name: '', email: '');
  }

  @override
  Future<bool> logout() {
    return _firebaseAuth
        .signOut()
        .then((value) => _firebaseAuth.currentUser == null);
  }
}
