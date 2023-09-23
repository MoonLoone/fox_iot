import 'dart:ui';

import 'package:flutter/cupertino.dart';

class FoxIoTAssets {
  String url;
  Size size;

  FoxIoTAssets(this.url, this.size);
}

enum FoxIotAssetName {
  email,
  passwordLock,
  person,
  visible,
  facebook,
}
