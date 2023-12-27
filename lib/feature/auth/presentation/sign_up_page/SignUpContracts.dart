import 'package:flutter/cupertino.dart';

import '../../../../utils/models/LoadingState.dart';


@immutable
class SignUpState {
  final String nickName;
  final String email;
  final String password;
  final String rPassword;
  final bool isPasswordVisible;
  final bool isRPasswordVisible;
  final LoadingState loadingState;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rPasswordController = TextEditingController();
  final TextEditingController nicknameController = TextEditingController();

  SignUpState(
      {this.nickName = "",
      this.email = "",
      this.password = "",
      this.isPasswordVisible = false,
      this.loadingState = LoadingState.notLoading,
      this.isRPasswordVisible = false,
      this.rPassword = ""});

  SignUpState updateState({
    String? nickname,
    String? email,
    String? password,
    String? rPassword,
    bool? isPasswordVisible,
    bool? isRPasswordVisible,
    LoadingState? loadingState,
  }) =>
      SignUpState(
          nickName: nickname ?? nickName,
          email: email ?? this.email,
          password: password ?? this.password,
          isPasswordVisible: isPasswordVisible ?? this.isRPasswordVisible,
          loadingState: loadingState ?? this.loadingState,
          isRPasswordVisible: isRPasswordVisible ?? this.isRPasswordVisible,
          rPassword: rPassword ?? this.rPassword);
}

abstract class SignUpActions {}

class ChangePasswordVisibilityClick extends SignUpActions {}

class ChangeRPasswordVisibilityClick extends SignUpActions {}

class NextButtonClick extends SignUpActions {}
