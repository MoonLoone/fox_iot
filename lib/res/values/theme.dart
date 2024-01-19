import 'package:flutter/cupertino.dart';
import 'package:fox_iot/res/values/assets.dart';
import 'package:fox_iot/res/values/colors.dart';
import 'package:fox_iot/res/values/sizes.dart';
import 'package:fox_iot/res/values/text_styles.dart';

class FoxIotTheme {
  FoxIotTheme._init(BuildContext context) {}

  static const BASE_ASSET_DIR = "lib/res/assets/";

  static const FoxIoTSizes sizes = FoxIoTSizes(
      primaryIconSize: Size(32.0, 32.0), secondaryIconSize: Size(24.0, 24.0));

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

  static final Map<FoxIotAssetName, FoxIoTAsset> assets = {
    FoxIotAssetName.undefined: FoxIoTAsset(
        url: "${BASE_ASSET_DIR}undefined.png", size: sizes.primaryIconSize),
    FoxIotAssetName.email: FoxIoTAsset(
        url: "${BASE_ASSET_DIR}e_mail_icon.png", size: sizes.primaryIconSize),
    FoxIotAssetName.passwordLock: FoxIoTAsset(
        url: "${BASE_ASSET_DIR}lock_passw_icon.png",
        size: sizes.primaryIconSize),
    FoxIotAssetName.person: FoxIoTAsset(
        url: "${BASE_ASSET_DIR}person_icon.png", size: sizes.primaryIconSize),
    FoxIotAssetName.visible: FoxIoTAsset(
        url: "${BASE_ASSET_DIR}visible_icon.png", size: sizes.primaryIconSize),
    FoxIotAssetName.facebook: FoxIoTAsset(
        url: "${BASE_ASSET_DIR}icon_facebook.png", size: sizes.primaryIconSize),
    FoxIotAssetName.navbarHomeSelected: FoxIoTAsset(
        url: "${BASE_ASSET_DIR}home_s.png", size: sizes.primaryIconSize),
    FoxIotAssetName.navbarAccountSelected: FoxIoTAsset(
        url: "${BASE_ASSET_DIR}account_s.png", size: sizes.primaryIconSize),
    FoxIotAssetName.navbarDevicesSelected: FoxIoTAsset(
        url: "${BASE_ASSET_DIR}devices_s.png", size: sizes.primaryIconSize),
    FoxIotAssetName.navbarRulesSelected: FoxIoTAsset(
        url: "${BASE_ASSET_DIR}rules_s.png", size: sizes.primaryIconSize),
    FoxIotAssetName.navbarHomeUnselected: FoxIoTAsset(
        url: "${BASE_ASSET_DIR}home_un.png", size: sizes.primaryIconSize),
    FoxIotAssetName.navbarAccountUnselected: FoxIoTAsset(
        url: "${BASE_ASSET_DIR}account_un.png", size: sizes.primaryIconSize),
    FoxIotAssetName.navbarDevicesUnselected: FoxIoTAsset(
        url: "${BASE_ASSET_DIR}devices_un.png", size: sizes.primaryIconSize),
    FoxIotAssetName.navbarRulesUnselected: FoxIoTAsset(
        url: "${BASE_ASSET_DIR}rules_un.png", size: sizes.primaryIconSize),
    FoxIotAssetName.addDevice: FoxIoTAsset(
        url: "${BASE_ASSET_DIR}add_device.png", size: sizes.primaryIconSize),
    FoxIotAssetName.bulb:
        FoxIoTAsset(url: "${BASE_ASSET_DIR}bulb.png", size: const Size(48, 48)),
    FoxIotAssetName.hub:
        FoxIoTAsset(url: "${BASE_ASSET_DIR}hub.png", size: const Size(48, 48)),
    FoxIotAssetName.errorSearch: FoxIoTAsset(
        url: "${BASE_ASSET_DIR}error_search.png", size: const Size(128, 128)),
    FoxIotAssetName.bluetooth: FoxIoTAsset(
        url: "${BASE_ASSET_DIR}bluetooth.png", size: const Size(128, 128)),
    FoxIotAssetName.settings: FoxIoTAsset(
        url: "${BASE_ASSET_DIR}settings.png", size: sizes.primaryIconSize),
    FoxIotAssetName.family: FoxIoTAsset(
        url: "${BASE_ASSET_DIR}family.png", size: sizes.primaryIconSize),
    FoxIotAssetName.support: FoxIoTAsset(
        url: "${BASE_ASSET_DIR}support.png", size: sizes.primaryIconSize),
    FoxIotAssetName.exit: FoxIoTAsset(
        url: "${BASE_ASSET_DIR}exit.png", size: sizes.primaryIconSize),
    FoxIotAssetName.familyMembers: FoxIoTAsset(
        url: "${BASE_ASSET_DIR}family_members.png", size: sizes.primaryIconSize),
    FoxIotAssetName.activeDevices: FoxIoTAsset(
        url: "${BASE_ASSET_DIR}active_devices.png", size: sizes.primaryIconSize),
  };

}
