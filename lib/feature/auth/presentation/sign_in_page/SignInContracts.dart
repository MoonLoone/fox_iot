import 'package:flutter/cupertino.dart';

import '../../../../utils/models/LoadingState.dart';

@immutable
class SignInState {
  final String email;
  final String password;
  final bool isPasswordVisible;
  final LoadingState loadingState;
  final bool isAuthorized;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignInState({this.email = "",
    this.password = "",
    this.isPasswordVisible = false,
    this.loadingState = LoadingState.notLoading,
    this.isAuthorized = false});

  SignInState updateState({String? email,
    String? password,
    bool? isPasswordVisible,
    LoadingState? loadingState,
    bool? isAuthorized}) {
    return SignInState(
        email: email ?? this.email,
        password: password ?? this.password,
        isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
        loadingState: loadingState ?? this.loadingState,
        isAuthorized: isAuthorized ?? this.isAuthorized);
  }
}

abstract class SignInActions {}

class SignInClick extends SignInActions {

  late final String? email;
  late final String? password;
  late Function()? navigateWhenAuth;

  SignInClick({this.email, this.password, this.navigateWhenAuth});

}

class ForgotPasswordClick extends SignInActions {}

class VisibleIconClick extends SignInActions {}
