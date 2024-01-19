import 'package:flutter/material.dart';
import 'package:fox_iot/feature/account/domain/models/AccountUserInfo.dart';
import 'package:fox_iot/feature/account/presentation/components/account_info_line.dart';

import '../../../../res/values/assets.dart';
import '../../../../res/values/s.dart';
import '../../../../res/values/theme.dart';
import '../../../../utils/AssetsManipulations.dart';

class AccountInfoWidget extends StatelessWidget {
  final AccountUserInfo _accountUserInfo;
  final BoxConstraints _parentConstraints;
  final Function onAccountImageClick;

  const AccountInfoWidget(
      this._accountUserInfo, this._parentConstraints, this.onAccountImageClick,
      {super.key});

  @override
  Widget build(BuildContext context) {
    FoxIoTAsset activeDevicesAsset =
        safetyGetAsset(FoxIotAssetName.activeDevices);
    FoxIoTAsset familyMembersAsset =
        safetyGetAsset(FoxIotAssetName.familyMembers);
    return Container(
      decoration: BoxDecoration(
          color: FoxIotTheme.colors.primary,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16))),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: _parentConstraints.maxHeight * 0.07,
              ),
              InkWell(
                onTap: onAccountImageClick(),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    safetyGetAsset(FoxIotAssetName.addDevice).url,
                    width: 160,
                    height: 160,
                    alignment: Alignment.center,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Text(
                _accountUserInfo.fullName,
                textAlign: TextAlign.center,
                style: FoxIotTheme.textStyles.h2,
              ),
              AccountInfoLine(activeDevicesAsset.url,
                  "${S.of(context).active_devices} ${_accountUserInfo.devicesCount}"),
              AccountInfoLine(familyMembersAsset.url,
                  "${S.of(context).family_members} ${_accountUserInfo.familyMembers}")
            ]),
      ),
    );
  }
}
