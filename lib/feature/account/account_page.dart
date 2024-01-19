import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fox_iot/feature/account/presentation/account_bloc.dart';
import 'package:fox_iot/feature/account/presentation/components/account_info_widget.dart';
import 'package:fox_iot/feature/account/presentation/components/account_page_line.dart';
import 'package:fox_iot/feature/account/presentation/contracts/account_actions.dart';
import 'package:fox_iot/feature/account/presentation/contracts/account_state.dart';
import 'package:fox_iot/utils/AssetsManipulations.dart';

import '../../res/components/navbar/navbar.dart';
import '../../res/components/navbar/navbar_states.dart';
import '../../res/values/assets.dart';
import '../../res/values/s.dart';

class AccountPage extends StatefulWidget {
  static const String navId = "account_page";

  const AccountPage({super.key});

  @override
  State<StatefulWidget> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AccountBloc>(context);
    FoxIoTAsset settingsAsset = safetyGetAsset(FoxIotAssetName.settings);
    FoxIoTAsset familyAsset = safetyGetAsset(FoxIotAssetName.family);
    FoxIoTAsset supportAsset = safetyGetAsset(FoxIotAssetName.support);
    FoxIoTAsset exitAsset = safetyGetAsset(FoxIotAssetName.exit);
    FoxIoTAsset nextArrowAsset = safetyGetAsset(FoxIotAssetName.nextArrow);
    Image nextArrow = Image.asset(
      nextArrowAsset.url,
      width: nextArrowAsset.size.width,
      height: nextArrowAsset.size.height,
    );
    return BlocBuilder<AccountBloc, AccountState>(builder: (context, state) {
      return Scaffold(
          bottomNavigationBar: FoxNavbar(
            NavbarStates.account,
          ),
          body: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                AccountInfoWidget(state.accountUserInfo, constraints, () {
                  bloc.add(OnAccountImageClick());
                }),
                Padding(
                  padding: const EdgeInsets.only(right: 16, left: 16),
                  child: Divider(
                    height: constraints.maxHeight * 0.03,
                    color: Colors.black,
                  ),
                ),
                SingleChildScrollView(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AccountPageLine(
                        text: S.of(context).settings,
                        onClickFunction: () {
                          bloc.add(OnSettingsClick());
                        },
                        leadingImg: Image.asset(
                          settingsAsset.url,
                          width: settingsAsset.size.width,
                          height: settingsAsset.size.height,
                        ),
                        finalImg: nextArrow),
                    AccountPageLine(
                        text: S.of(context).family,
                        onClickFunction: () {
                          bloc.add(OnFamilyClick());
                        },
                        leadingImg: Image.asset(
                          familyAsset.url,
                          width: familyAsset.size.width,
                          height: familyAsset.size.height,
                        ),
                        finalImg: nextArrow),
                    AccountPageLine(
                        text: S.of(context).support,
                        onClickFunction: () {
                          bloc.add(OnSupportClick());
                        },
                        leadingImg: Image.asset(
                          supportAsset.url,
                          width: supportAsset.size.width,
                          height: supportAsset.size.height,
                        ),
                        finalImg: nextArrow),
                    AccountPageLine(
                        text: S.of(context).exit,
                        onClickFunction: () {
                          bloc.add(OnExitClick());
                        },
                        leadingImg: Image.asset(
                          exitAsset.url,
                          width: exitAsset.size.width,
                          height: exitAsset.size.height,
                        ),
                        finalImg: null),
                  ],
                ))
              ],
            );
          }));
    });
  }
}
