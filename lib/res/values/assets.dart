import 'dart:ui';

import 'package:flutter/cupertino.dart';

class FoxIoTAssets {
  final String url;
  final Size size;

  FoxIoTAssets({required this.url, required this.size});
}

enum FoxIotAssetName {
  email,
  passwordLock,
  person,
  visible,
  facebook,
  navbarHomeSelected,
  navbarAccountSelected,
  navbarDevicesSelected,
  navbarRulesSelected,
  navbarHomeUnselected,
  navbarAccountUnselected,
  navbarDevicesUnselected,
  navbarRulesUnselected
}
