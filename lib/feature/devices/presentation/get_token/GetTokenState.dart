import 'package:fox_iot/utils/models/LoadingState.dart';

class GetTokenState {
  final String? token;
  final LoadingState loadingState;

  const GetTokenState({this.token, this.loadingState = const Loading()});

  GetTokenState updateState({
    String? token,
    LoadingState? loadingState
  }) {
    return GetTokenState(
        token: token ?? this.token,
        loadingState: loadingState ?? this.loadingState);
  }

}
