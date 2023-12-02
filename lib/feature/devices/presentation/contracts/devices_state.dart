import 'package:flutter/cupertino.dart';

import '../../../../utils/models/LoadingState.dart';

@immutable
class DevicesState {
  final LoadingState loadingState;

  const DevicesState({this.loadingState = LoadingState.notLoading});

  DevicesState updateState({LoadingState? loadingState}) {
    return DevicesState(loadingState: loadingState ?? this.loadingState);
  }
}
