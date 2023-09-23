import 'package:flutter/cupertino.dart';
import 'package:fox_iot/res/values/assets.dart';
import 'package:fox_iot/res/values/colors.dart';
import 'package:fox_iot/res/values/text_styles.dart';

class FoxIotTheme {
  FoxIotTheme._init(BuildContext context) {}

  static final FoxIoTColors colors = FoxIoTColors(
    primary: const Color(0xFFfcd383),
    secondary: const Color(0xFFEFEAD0),
    primaryContainer: const Color(0xFFffffff),
    tint: const Color(0x30000000),
    textPrimary: const Color(0xFF000000),
    textSecondary: const Color(0xFF898989),
    third: const Color(0xFFDE6640),
    onThird: const Color(0xFFffffff),
  );

  static final FoxTextStyles textStyles = FoxTextStyles(
    primary: TextStyle(fontSize: 16, color: colors.textPrimary),
    secondary: TextStyle(fontSize: 12, color: colors.textSecondary),
    h1: TextStyle(fontSize: 56, color: colors.textPrimary),
    h2: TextStyle(fontSize: 48, color: colors.textPrimary),
    h3: TextStyle(fontSize: 32, color: colors.textPrimary),
    h4: TextStyle(fontSize: 24, color: colors.textPrimary),
  );

  static final Map<FoxIotAssetName, FoxIoTAssets> assets = {
    FoxIotAssetName.email: FoxIoTAssets(
        url: "lib/res/assets/e_mail_icon.png", size: const Size(32, 32)),
    FoxIotAssetName.passwordLock: FoxIoTAssets(
        url: "lib/res/assets/lock_passw_icon.png", size: const Size(32, 32)),
    FoxIotAssetName.person: FoxIoTAssets(
        url: "lib/res/assets/person_icon.png", size: const Size(32, 32)),
    FoxIotAssetName.visible: FoxIoTAssets(
        url: "lib/res/assets/visible_icon.png", size: const Size(32, 32)),
    FoxIotAssetName.facebook: FoxIoTAssets(
        url: "lib/res/assets/icon_facebook.png", size: const Size(32, 32)),
  };
}
