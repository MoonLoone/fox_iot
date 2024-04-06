import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fox_iot/feature/devices/presentation/connect_with_ap/ConnectWithApPage.dart';
import 'package:fox_iot/feature/devices/presentation/get_token/GetTokenBloc.dart';
import 'package:fox_iot/feature/devices/presentation/get_token/GetTokenState.dart';
import 'package:fox_iot/feature/devices/presentation/select_device_to_connect/SelectDeviceToConnectPage.dart';
import 'package:fox_iot/res/components/fox_iot_buttons.dart';
import 'package:fox_iot/res/values/assets.dart';
import 'package:fox_iot/res/values/theme.dart';
import 'package:fox_iot/utils/AssetsManipulations.dart';
import 'package:fox_iot/utils/models/LoadingState.dart';
import 'package:hive/hive.dart';

class GetTokenPage extends StatelessWidget {
  static const String navId = "get_token_page";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTokenBloc, GetTokenState>(builder: (context, state) {
      String? token = state.token;
      if (state.loadingState is Loading) {
        return loadingScreen(context);
      }
      if (token != null) {
        return tokenGetSuccess(context, token);
      }
      return loadingScreen(context);
    });
  }

  Widget loadingScreen(BuildContext context) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Get token",
            style: FoxIotTheme.textStyles.h3,
          ),
          centerTitle: true,
        ),
        body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Getting token",
                    style: FoxIotTheme.textStyles.primary,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const SizedBox(
                    width: 128,
                    height: 128,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            )),
        floatingActionButton: FoxIoTPrimaryButton(
          btnText: "Abort",
          onClick: () =>
              Navigator.pushNamed(context, SelectDeviceToConnectPage.navId),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );

  Widget tokenGetSuccess(BuildContext context, String token) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Get token",
            style: FoxIotTheme.textStyles.h3,
          ),
          centerTitle: true,
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Token received"),
              Text("successfully"),
              Text(token),
              SvgPicture.asset(
                safetyGetAsset(FoxIotAssetName.successBig).url,
                height: 152,
                width: 152,
              ),
              Stack(
                children: [
                  SvgPicture.asset(
                      safetyGetAsset(FoxIotAssetName.important).url),
                  ColoredBox(
                    color: FoxIotTheme.colors.primary,
                    child: Center(
                      child: Text("Now you need to connect to device AP"),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FoxIoTPrimaryButton(
          btnText: "Next step",
          onClick: () => Navigator.pushNamed(context, ConnectWithApPage.navId, arguments: token),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
}
