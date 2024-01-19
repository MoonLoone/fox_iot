import 'package:flutter/cupertino.dart';
import 'package:fox_iot/utils/models/LoadingState.dart';

import '../../domain/models/AccountUserInfo.dart';

@immutable
class AccountState {
  final LoadingState loadingState;
  final AccountUserInfo accountUserInfo;

  const AccountState(
      {this.loadingState = const NotLoading(),
      this.accountUserInfo = const UndefinedUserInfo()});

  AccountState updateState(
      {LoadingState? loadingState, AccountUserInfo? accountUserInfo}) {
    return AccountState(
        loadingState: loadingState ?? this.loadingState,
        accountUserInfo: accountUserInfo ?? this.accountUserInfo);
  }
}
