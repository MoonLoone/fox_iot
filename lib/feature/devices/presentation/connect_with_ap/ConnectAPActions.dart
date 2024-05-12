import 'package:fox_iot/feature/home/domain/FoxIoTRoom.dart';
import 'package:fox_iot/utils/IFoxIoTActions.dart';

class ConnectAPActions extends IFoxIoTActions {}

class OnInitWithToken extends ConnectAPActions {
  final String token;

  OnInitWithToken(this.token);
}

class ConnectClick extends ConnectAPActions {
  final String wifiName;
  final String wifiPassword;

  ConnectClick(
      {required this.wifiName, required this.wifiPassword});
}

class ChangeCurrentRoom extends ConnectAPActions {
  final FoxIoTRoom room;

  ChangeCurrentRoom(this.room);
}
