import 'package:fox_iot/feature/devices/domain/models/Device.dart';
import 'package:fox_iot/feature/home/domain/FoxIoTRoom.dart';
import 'package:fox_iot/utils/IFoxIoTActions.dart';

class ConnectZigbeeActions extends IFoxIoTActions {}

class OnReturnClick extends ConnectZigbeeActions {
  Function back;

  OnReturnClick(this.back);
}

class OnNextClick extends ConnectZigbeeActions {
  Function next;

  OnNextClick(this.next);
}

class OnStartConnectingClick extends ConnectZigbeeActions {
  String? hubId;
  int? roomId;

  OnStartConnectingClick(this.hubId, this.roomId);
}

class OnChangeCurrentGW extends ConnectZigbeeActions {
  Device newGw;

  OnChangeCurrentGW(this.newGw);
}

class OnChangeCurrentRoom extends ConnectZigbeeActions {
  FoxIoTRoom newRoom;

  OnChangeCurrentRoom(this.newRoom);
}
