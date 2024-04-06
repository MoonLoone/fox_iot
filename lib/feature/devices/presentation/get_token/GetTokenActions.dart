import 'package:fox_iot/utils/IFoxIoTActions.dart';

abstract class GetTokenActions extends IFoxIoTActions {}

class OnAbortClick extends GetTokenActions {
  final Function navigateBack;

  OnAbortClick(this.navigateBack);
}

class OnNextClick extends GetTokenActions {
  final Function(String) navigateNext;

  OnNextClick(this.navigateNext);
}
