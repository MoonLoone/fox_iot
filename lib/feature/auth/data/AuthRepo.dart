import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fox_iot/feature/auth/domain/IAuthRepo.dart';
import 'package:fox_iot/feature/auth/domain/models/FoxIoTUser.dart';
import 'package:fox_iot/utils/safe_operations.dart';
import 'package:get_it/get_it.dart';

import '../../../local_storage/domain/IFoxIoTUserDb.dart';
import '../../../local_storage/domain/models/FoxIoTUser.dart';
import '../../../local_storage/domain/models/MainUserInfo.dart';
import '../../../utils/models/Response.dart';
import '../../../utils/user_ext.dart';

extension on UserCredential {
  AuthUserDTO toDomainModel() => AuthUserDTO(
      uid: user?.uid ?? "",
      name: user?.displayName ?? "",
      email: user?.email ?? "");
}

extension on DocumentSnapshot<Map<String, dynamic>> {
  FoxIoTUser toFoxIoTUser(String userUID) {
    String name = data()?["name"] ?? "";
    String avatarUrl = data()?["avatar_url"] ?? "";
    String bio = data()?["bio"] ?? "";
    MainUserInfo mainUserInfo =
        MainUserInfo(name: name, bio: bio, avatarUrl: avatarUrl);
    return FoxIoTUser(id: userUID, mainUserInfo: mainUserInfo);
  }
}

class AuthRepo extends IAuthRepo {
  final String authUrl = "https://openapi.tuyaeu.com/v1.0/token?grantType=1";

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final IFoxIoTUserDb _userDb = GetIt.I.get<IFoxIoTUserDb>();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<Response<AuthUserDTO>> createAuthUser(
      String email, String password) async {
    return safeApiRequest(() => _firebaseAuth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) {
          final domainModel = value.toDomainModel();
          return domainModel;
        }));
  }

  @override
  Future<Response<AuthUserDTO>> authorizeWithEmailAndPassword(
      String email, String password, Function() onSuccessCallback) async {
    return safeApiRequest(() => _firebaseAuth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) async {
          AuthUserDTO userDTO = value.toDomainModel();
          Response<FoxIoTUser> userInfoResponse =
              await _getAuthorizedUserInfo(userDTO.uid);
          if (userInfoResponse is SuccessResponse) {
            await _userDb.replaceCurrentUser((userInfoResponse as SuccessResponse).data);
            onSuccessCallback();
          }
          return userDTO;
        }));
  }

  Future<Response<FoxIoTUser>> _getAuthorizedUserInfo(String userUID) async {
    return safeApiRequest(() {
      return _firebaseFirestore
          .collection("users")
          .doc(userUID)
          .get()
          .then((value) => value.toFoxIoTUser(userUID));
    });
  }

  @override
  Future<Response<AuthUserDTO>> authorizeWithGoogle(
      Function() onSuccessCallback) async {
    //todo Авторизация через Google
    return SuccessResponse(AuthUserDTO(uid: "", name: '', email: ''));
  }

  @override
  Future<Response<bool>> logout() async {
    return safeApiRequest(() => _firebaseAuth.signOut().then((_) {
          return _firebaseAuth.currentUser == null;
        }));
  }

  @override
  Future<Response<bool>> sendMainUserInfo(String userId, MainUserInfo mainUserInfo) {
    return safeApiRequest(() async {
      final user = FoxIoTUser(id: userId, mainUserInfo: mainUserInfo);
      _firebaseFirestore
          .collection("users")
          .doc(userId)
          .set(getUserDocument(user));
      final docRef = _firebaseFirestore.collection("users").doc(userId);
      return docRef.get().then((value) => value.exists);
    });
  }
}
