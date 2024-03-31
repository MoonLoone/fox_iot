
import 'package:fox_iot/utils/IFoxIoTActions.dart';

abstract class HomeActions extends IFoxIoTActions{}

class OnChangeHomeClick extends HomeActions{}
class ChangeHome extends HomeActions{
  final String selectedHomeName;
  ChangeHome(this.selectedHomeName);
}
class OnEditHomeClick extends HomeActions{}
class OnRoomClick extends HomeActions{
  final String roomId;
  OnRoomClick(this.roomId);
}
class OnCreateHomeClick extends HomeActions{

  final Function navigateToCreateHome;
  OnCreateHomeClick(this.navigateToCreateHome);

}
