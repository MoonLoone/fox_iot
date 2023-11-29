import 'package:flutter/cupertino.dart';

import '../models/LoadingState.dart';

@immutable
class SignInState {
  final String email;
  final String password;
  final bool isPasswordVisible;
  final LoadingState loadingState;

  const SignInState(
      {this.email = "",
      this.password = "",
      this.isPasswordVisible = false,
      this.loadingState = LoadingState.notLoading});

  SignInState updateState(
      {String? email,
      String? password,
      bool? isPasswordVisible,
      LoadingState? loadingState}) {
    return SignInState(
        email: email ?? this.email,
        password: password ?? this.password,
        isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
        loadingState: loadingState ?? this.loadingState);
  }
}

abstract class SignInActions {}

class SignInClick extends SignInActions {}

class ForgotPasswordClick extends SignInActions {}

class VisibleIconClick extends SignInActions {}
