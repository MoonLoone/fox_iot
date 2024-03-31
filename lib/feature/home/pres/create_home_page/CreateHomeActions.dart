
import 'package:fox_iot/utils/IFoxIoTActions.dart';

abstract class CreateHomeActions extends IFoxIoTActions{}

class OnConfirmClick extends CreateHomeActions{
  String? homeName;
  String? location;
  Function onSuccess;

  OnConfirmClick({this.homeName, this.location, required this.onSuccess});

}
