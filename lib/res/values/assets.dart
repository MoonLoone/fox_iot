import 'dart:ui';

import 'package:flutter/cupertino.dart';

class FoxIoTAsset {
  final String url;
  final Size size;

  FoxIoTAsset({required this.url, required this.size});
}

class UndefinedAsset extends FoxIoTAsset {
  UndefinedAsset(
      {super.url = "lib/res/assets/undefined.png",
      super.size = const Size(24, 24)});
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
  errorSearch,
  settings,
  family,
  support,
  exit,
  activeDevices,
  familyMembers,
  nextArrow,
  changePencil,
  confirm
}
