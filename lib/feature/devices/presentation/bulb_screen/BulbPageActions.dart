import 'dart:ui';

import 'package:fox_iot/utils/IFoxIoTActions.dart';

class BulbPageActions extends IFoxIoTActions {}

class OnColorChange extends BulbPageActions {
  final Color newColor;

  OnColorChange({required this.newColor});
}

class OnOnOffBulbClick extends BulbPageActions {
  final bool newBulbState;

  OnOnOffBulbClick({required this.newBulbState});
}
