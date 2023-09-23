import 'package:flutter/cupertino.dart';
import 'package:fox_iot/res/values/assets.dart';
import 'package:fox_iot/res/values/colors.dart';
import 'package:fox_iot/res/values/text_styles.dart';

class FoxIotTheme {
  FoxIotTheme._init(BuildContext context) {}

  static final FoxIoTColors colors = FoxIoTColors(
      const Color(0xFFfcd383),
      const Color(0xFFEFEAD0),
      const Color(0xFFffffff),
      const Color(0x30000000),
      const Color(0xFF000000),
      const Color(0xFF898989),
      const Color(0xFFDE6640));

  static final FoxTextStyles textStyles = FoxTextStyles(
    TextStyle(fontSize: 16, color: colors.textPrimary),
    TextStyle(fontSize: 12, color: colors.textSecondary),
    TextStyle(fontSize: 56, color: colors.primary),
    TextStyle(fontSize: 48, color: colors.primary),
    TextStyle(fontSize: 32, color: colors.primary),
    TextStyle(fontSize: 24, color: colors.primary),
  );

  static final Map<FoxIotAssetName, FoxIoTAssets> assets = {
    FoxIotAssetName.email:
        FoxIoTAssets("lib/res/assets/e_mail_icon.png", const Size(32, 32)),
    FoxIotAssetName.passwordLock:
        FoxIoTAssets("lib/res/assets/lock_passw_icon.png", const Size(32, 32)),
    FoxIotAssetName.person:
        FoxIoTAssets("lib/res/assets/person_icon.png", const Size(32, 32)),
    FoxIotAssetName.visible:
        FoxIoTAssets("lib/res/assets/visible_icon.png", const Size(32, 32)),
    FoxIotAssetName.facebook:
        FoxIoTAssets("lib/res/assets/icon_facebook.png", const Size(32, 32)),
  };
}
