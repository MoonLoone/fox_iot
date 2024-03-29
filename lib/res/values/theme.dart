import 'package:flutter/cupertino.dart';
import 'package:fox_iot/res/values/assets.dart';
import 'package:fox_iot/res/values/colors.dart';
import 'package:fox_iot/res/values/sizes.dart';
import 'package:fox_iot/res/values/text_styles.dart';

class FoxIotTheme {
  FoxIotTheme._init(BuildContext context) {}

  static const _BASE_ASSET_DIR = "lib/res/assets/";

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
    h1: TextStyle(
        fontSize: 56, color: colors.textPrimary, fontWeight: FontWeight.bold),
    h2: TextStyle(
        fontSize: 48, color: colors.textPrimary, fontWeight: FontWeight.bold),
    h3: TextStyle(
        fontSize: 32, color: colors.textPrimary, fontWeight: FontWeight.bold),
    h4: TextStyle(fontSize: 24, color: colors.textPrimary, fontWeight: FontWeight.bold),
  );

  static final Map<FoxIotAssetName, FoxIoTAsset> assets = {
    FoxIotAssetName.undefined: FoxIoTAsset(
        url: "${_BASE_ASSET_DIR}undefined.png", size: sizes.primaryIconSize),
    FoxIotAssetName.email: FoxIoTAsset(
        url: "${_BASE_ASSET_DIR}e_mail_icon.png", size: sizes.primaryIconSize),
    FoxIotAssetName.passwordLock: FoxIoTAsset(
        url: "${_BASE_ASSET_DIR}lock_passw_icon.png",
        size: sizes.primaryIconSize),
    FoxIotAssetName.person: FoxIoTAsset(
        url: "${_BASE_ASSET_DIR}person_icon.png", size: sizes.primaryIconSize),
    FoxIotAssetName.visible: FoxIoTAsset(
        url: "${_BASE_ASSET_DIR}visible_icon.png", size: sizes.primaryIconSize),
    FoxIotAssetName.navbarHomeSelected: FoxIoTAsset(
        url: "${_BASE_ASSET_DIR}home_s.png", size: sizes.primaryIconSize),
    FoxIotAssetName.navbarAccountSelected: FoxIoTAsset(
        url: "${_BASE_ASSET_DIR}account_s.png", size: sizes.primaryIconSize),
    FoxIotAssetName.navbarDevicesSelected: FoxIoTAsset(
        url: "${_BASE_ASSET_DIR}devices_s.png", size: sizes.primaryIconSize),
    FoxIotAssetName.navbarRulesSelected: FoxIoTAsset(
        url: "${_BASE_ASSET_DIR}rules_s.png", size: sizes.primaryIconSize),
    FoxIotAssetName.navbarHomeUnselected: FoxIoTAsset(
        url: "${_BASE_ASSET_DIR}home_un.png", size: sizes.primaryIconSize),
    FoxIotAssetName.navbarAccountUnselected: FoxIoTAsset(
        url: "${_BASE_ASSET_DIR}account_un.png", size: sizes.primaryIconSize),
    FoxIotAssetName.navbarDevicesUnselected: FoxIoTAsset(
        url: "${_BASE_ASSET_DIR}devices_un.png", size: sizes.primaryIconSize),
    FoxIotAssetName.navbarRulesUnselected: FoxIoTAsset(
        url: "${_BASE_ASSET_DIR}rules_un.png", size: sizes.primaryIconSize),
    FoxIotAssetName.addDevice: FoxIoTAsset(
        url: "${_BASE_ASSET_DIR}add_device.png", size: sizes.primaryIconSize),
    FoxIotAssetName.bulb: FoxIoTAsset(
        url: "${_BASE_ASSET_DIR}bulb.png", size: const Size(48, 48)),
    FoxIotAssetName.hub:
        FoxIoTAsset(url: "${_BASE_ASSET_DIR}hub.png", size: const Size(48, 48)),
    FoxIotAssetName.errorSearch: FoxIoTAsset(
        url: "${_BASE_ASSET_DIR}error_search.png", size: const Size(128, 128)),
    FoxIotAssetName.bluetooth: FoxIoTAsset(
        url: "${_BASE_ASSET_DIR}bluetooth.png", size: const Size(128, 128)),
    FoxIotAssetName.settings: FoxIoTAsset(
        url: "${_BASE_ASSET_DIR}settings.png", size: sizes.primaryIconSize),
    FoxIotAssetName.family: FoxIoTAsset(
        url: "${_BASE_ASSET_DIR}family.png", size: sizes.primaryIconSize),
    FoxIotAssetName.support: FoxIoTAsset(
        url: "${_BASE_ASSET_DIR}support.png", size: sizes.primaryIconSize),
    FoxIotAssetName.exit: FoxIoTAsset(
        url: "${_BASE_ASSET_DIR}exit.png", size: sizes.primaryIconSize),
    FoxIotAssetName.familyMembers: FoxIoTAsset(
        url: "${_BASE_ASSET_DIR}family_members.png",
        size: sizes.secondaryIconSize),
    FoxIotAssetName.activeDevices: FoxIoTAsset(
        url: "${_BASE_ASSET_DIR}active_devices.png",
        size: sizes.secondaryIconSize),
    FoxIotAssetName.nextArrow: FoxIoTAsset(
        url: "${_BASE_ASSET_DIR}next_arrow.png", size: sizes.primaryIconSize),
    FoxIotAssetName.signUpFoxGif: FoxIoTAsset(
        url: "${_BASE_ASSET_DIR}sign_up_fox_gif.gif",
        size: sizes.primaryIconSize),
    FoxIotAssetName.google: FoxIoTAsset(
        url: "${_BASE_ASSET_DIR}devicon_google.png",
        size: sizes.primaryIconSize),
    FoxIotAssetName.logo1: FoxIoTAsset(
        url: "${_BASE_ASSET_DIR}logo1.png",
        size: sizes.primaryIconSize),
    FoxIotAssetName.back: FoxIoTAsset(
        url: "${_BASE_ASSET_DIR}back_btn.svg",
        size: sizes.primaryIconSize),
    FoxIotAssetName.enterName: FoxIoTAsset(
        url: "${_BASE_ASSET_DIR}enter_name.svg",
        size: sizes.primaryIconSize),
    FoxIotAssetName.bio: FoxIoTAsset(
        url: "${_BASE_ASSET_DIR}bio.svg",
        size: sizes.primaryIconSize),
    FoxIotAssetName.addRoom: FoxIoTAsset(
        url: "${_BASE_ASSET_DIR}add.svg",
        size: sizes.primaryIconSize),
  };
}
