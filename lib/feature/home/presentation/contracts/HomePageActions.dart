import '../../../../utils/IFoxIoTActions.dart';

abstract class HomePageActions extends IFoxIoTActions {}

class OnChangeClick extends HomePageActions {}

class OnConfirmClick extends HomePageActions {}

class OnAddRoomClick extends HomePageActions {}

class OnRoomClick extends HomePageActions {
  final String _roomId;
  OnRoomClick(this._roomId);
}

class PlusClick extends HomePageActions {}
class OnInitLoadHome extends HomePageActions{}
