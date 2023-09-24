import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fox_iot/res/components/background.dart';
import 'package:fox_iot/res/values/assets.dart';
import 'package:fox_iot/res/values/theme.dart';

import '../../../../res/values/s.dart';
import '../SignInBloc.dart';
import '../SignInContracts.dart';

class SignInPage extends StatefulWidget {
  static const String navId = "sign_in_page";

  @override
  State<StatefulWidget> createState() => SignInPageState();
}

class SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
      final loading = state.loadingState;
      final isPasswordVisible = state.isPasswordVisible;
      return Background(
          child: Scaffold(
              backgroundColor: Colors.amber.withOpacity(0),
              body: Stack(children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: DecoratedBox(
                      decoration:
                          BoxDecoration(color: FoxIotTheme.colors.tint)),
                ),
                Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(S.of(context).signIn,
                            style: FoxIotTheme.textStyles.h3),
                        Text(
                          "Nero forte...",
                          style: FoxIotTheme.textStyles.primary,
                        ),
                      ],
                    )),
                Center(
                    child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: FoxIotTheme.colors.primaryContainer,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(32))),
                      child: Padding(
                          padding: const EdgeInsets.only(
                            left: 32,
                            right: 32,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              TextField(
                                style: FoxIotTheme.textStyles.primary,
                                decoration: InputDecoration(
                                  fillColor: FoxIotTheme.colors.secondary,
                                  prefixIcon: Image.asset(FoxIotTheme
                                      .assets[FoxIotAssetName.email]!.url),
                                  hintText: S.of(context).e_mail,
                                  filled: true,
                                ),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              TextField(
                                textAlignVertical: TextAlignVertical.center,
                                style: FoxIotTheme.textStyles.primary,
                                decoration: InputDecoration(
                                    fillColor: FoxIotTheme.colors.secondary,
                                    prefixIcon: Image.asset(FoxIotTheme
                                        .assets[FoxIotAssetName.passwordLock]!
                                        .url),
                                    suffixIcon: IconButton(
                                      alignment: Alignment.center,
                                      icon: Image.asset(FoxIotTheme
                                          .assets[FoxIotAssetName.visible]!
                                          .url),
                                      onPressed: () {
                                        BlocProvider.of<SignInBloc>(context)
                                            .add(VisibleIconClick());
                                      },
                                    ),
                                    hintText: S.of(context).password,
                                    filled: true),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              TextButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        FoxIotTheme.colors.third),
                                    padding: MaterialStateProperty.all(
                                        const EdgeInsets.all(20)),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(100)))),
                                child: Text(
                                  S.of(context).signIn,
                                  style: FoxIotTheme.textStyles.primary
                                      .copyWith(
                                          color: FoxIotTheme.colors.onThird),
                                ),
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              Text(
                                S.of(context).forgot_password,
                                style: FoxIotTheme.textStyles.primary,
                              )
                            ],
                          ))),
                ))
              ])));
    });
  }
}
