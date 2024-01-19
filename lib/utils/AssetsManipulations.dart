import 'package:fox_iot/res/values/assets.dart';

import '../res/values/theme.dart';

FoxIoTAsset safetyGetAsset(FoxIotAssetName name) {
  return FoxIotTheme.assets[name] ?? UndefinedAsset();
}
