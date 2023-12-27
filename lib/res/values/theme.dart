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
    FoxIotAssetName.undefined: FoxIoTAssets(
        url: "lib/res/assets/undefined.png", size: const Size(32, 32)),
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
    FoxIotAssetName.navbarHomeSelected: FoxIoTAssets(
        url: "lib/res/assets/home_s.png", size: const Size(32, 32)),
    FoxIotAssetName.navbarAccountSelected: FoxIoTAssets(
        url: "lib/res/assets/account_s.png", size: const Size(32, 32)),
    FoxIotAssetName.navbarDevicesSelected: FoxIoTAssets(
        url: "lib/res/assets/devices_s.png", size: const Size(32, 32)),
    FoxIotAssetName.navbarRulesSelected: FoxIoTAssets(
        url: "lib/res/assets/rules_s.png", size: const Size(32, 32)),
    FoxIotAssetName.navbarHomeUnselected: FoxIoTAssets(
        url: "lib/res/assets/home_un.png", size: const Size(32, 32)),
    FoxIotAssetName.navbarAccountUnselected: FoxIoTAssets(
        url: "lib/res/assets/account_un.png", size: const Size(32, 32)),
    FoxIotAssetName.navbarDevicesUnselected: FoxIoTAssets(
        url: "lib/res/assets/devices_un.png", size: const Size(32, 32)),
    FoxIotAssetName.navbarRulesUnselected: FoxIoTAssets(
        url: "lib/res/assets/rules_un.png", size: const Size(32, 32)),
    FoxIotAssetName.addDevice: FoxIoTAssets(
        url: "lib/res/assets/add_device.png", size: const Size(32, 32)),
    FoxIotAssetName.bulb:
        FoxIoTAssets(url: "lib/res/assets/bulb.png", size: const Size(48, 48)),
    FoxIotAssetName.hub:
        FoxIoTAssets(url: "lib/res/assets/hub.png", size: const Size(48, 48)),
    FoxIotAssetName.errorSearch: FoxIoTAssets(
        url: "lib/res/assets/error_search.png", size: const Size(128, 128)),
    FoxIotAssetName.bluetooth: FoxIoTAssets(
        url: "lib/res/assets/bluetooth.png", size: const Size(128, 128)),
  };
}
