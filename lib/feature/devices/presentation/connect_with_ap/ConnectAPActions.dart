import 'package:fox_iot/utils/IFoxIoTActions.dart';

class ConnectAPActions extends IFoxIoTActions {}

class OnInitWithToken extends ConnectAPActions {
  final String token;
  OnInitWithToken(this.token);
}
