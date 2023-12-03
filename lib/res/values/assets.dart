import 'dart:ui';

import 'package:flutter/cupertino.dart';

class FoxIoTAssets {
  final String url;
  final Size size;

  FoxIoTAssets({required this.url, required this.size});
}

enum FoxIotAssetName {
  undefined,
  email,
  passwordLock,
  person,
  visible,
  facebook,
  addDevice,
  navbarHomeSelected,
  navbarAccountSelected,
  navbarDevicesSelected,
  navbarRulesSelected,
  navbarHomeUnselected,
  navbarAccountUnselected,
  navbarDevicesUnselected,
  navbarRulesUnselected,
  hub,
  bulb,
  bluetooth,
  errorSearch
}
