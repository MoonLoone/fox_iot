import 'package:fox_iot/feature/devices/domain/models/Device.dart';
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

  OnStartConnectingClick(this.hubId);
}

class OnChangeCurrentGW extends ConnectZigbeeActions {
  Device newGw;

  OnChangeCurrentGW(this.newGw);
}
