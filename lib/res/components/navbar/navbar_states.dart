import 'package:flutter/cupertino.dart';
import 'package:fox_iot/res/values/assets.dart';

import '../../values/s.dart';

enum NavbarStates { home, devices, rules, account }

extension NavbarStatesAsset on NavbarStates {
  FoxIotAssetName assetName(bool isSelected) {
    if (isSelected) {
      switch (this) {
        case NavbarStates.home:
          return FoxIotAssetName.navbarHomeSelected;
        case NavbarStates.devices:
          return FoxIotAssetName.navbarDevicesSelected;
        case NavbarStates.rules:
          return FoxIotAssetName.navbarRulesSelected;
        case NavbarStates.account:
          return FoxIotAssetName.navbarAccountSelected;
      }
    } else {
      switch (this) {
        case NavbarStates.home:
          return FoxIotAssetName.navbarHomeUnselected;
        case NavbarStates.devices:
          return FoxIotAssetName.navbarDevicesUnselected;
        case NavbarStates.rules:
          return FoxIotAssetName.navbarRulesUnselected;
        case NavbarStates.account:
          return FoxIotAssetName.navbarAccountUnselected;
      }
    }
  }

  String getName(BuildContext context) {
    switch (this) {
      case NavbarStates.home:
        return S.of(context).navbar_home;
      case NavbarStates.devices:
        return S.of(context).navbar_devices;
      case NavbarStates.rules:
        return S.of(context).navbar_rules;
      case NavbarStates.account:
        return S.of(context).navbar_account;
    }
  }
}
