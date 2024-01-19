import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fox_iot/feature/account/presentation/account_bloc.dart';
import 'package:fox_iot/feature/account/presentation/contracts/account_state.dart';
import 'package:fox_iot/utils/AssetsManipulations.dart';

import '../../res/components/navbar/navbar.dart';
import '../../res/components/navbar/navbar_states.dart';
import '../../res/values/assets.dart';
import '../../res/values/theme.dart';

class AccountPage extends StatefulWidget {
  static const String navId = "account_page";

  @override
  State<StatefulWidget> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    FoxIoTAsset activeDevicesAsset =
        safetyGetAsset(FoxIotAssetName.activeDevices);
    FoxIoTAsset familyMembersAsset =
        safetyGetAsset(FoxIotAssetName.familyMembers);
    FoxIoTAsset settingsAsset = safetyGetAsset(FoxIotAssetName.settings);
    FoxIoTAsset familyAsset = safetyGetAsset(FoxIotAssetName.family);
    FoxIoTAsset supportAsset = safetyGetAsset(FoxIotAssetName.support);
    FoxIoTAsset exitAsset = safetyGetAsset(FoxIotAssetName.exit);
    return BlocBuilder<AccountBloc, AccountState>(builder: (context, state) {
      return Scaffold(
          bottomNavigationBar: FoxNavbar(
            NavbarStates.account,
          ),
          body: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            return Column(mainAxisSize: MainAxisSize.max, children: [
              Container(
                decoration: BoxDecoration(
                    color: FoxIotTheme.colors.primary,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16))),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 16, bottom: 16),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: constraints.maxHeight * 0.07,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            safetyGetAsset(FoxIotAssetName.addDevice).url,
                            width: 224,
                            height: 224,
                            alignment: Alignment.center,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          state.accountUserInfo.fullName,
                          textAlign: TextAlign.center,
                          style: FoxIotTheme.textStyles.h2,
                        ),
                        Row(children: [
                          Image.asset(
                            activeDevicesAsset.url,
                            width: activeDevicesAsset.size.width,
                            height: activeDevicesAsset.size.height,
                            alignment: Alignment.center,
                            fit: BoxFit.fill,
                          ),
                          Text("Active devices",
                              style: FoxIotTheme.textStyles.primary
                                  .copyWith(fontWeight: FontWeight.bold)),
                          Text(
                            state.accountUserInfo.devicesCount.toString(),
                            style: FoxIotTheme.textStyles.primary,
                          )
                        ]),
                        Row(children: [
                          Image.asset(
                            familyMembersAsset.url,
                            width: familyMembersAsset.size.width,
                            height: familyMembersAsset.size.height,
                            alignment: Alignment.center,
                            fit: BoxFit.fill,
                          ),
                          Text("Family members",
                              style: FoxIotTheme.textStyles.primary
                                  .copyWith(fontWeight: FontWeight.bold)),
                          Text(
                            state.accountUserInfo.familyMembers.toString(),
                            style: FoxIotTheme.textStyles.primary,
                          )
                        ])
                      ]),
                ),
              )
            ]);
          }));
    });
  }
}
