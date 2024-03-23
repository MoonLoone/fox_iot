import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fox_iot/feature/auth/presentation/main_info_page/MainInfoPage.dart';
import 'package:fox_iot/feature/auth/presentation/sign_up_page/SignUpContracts.dart';
import 'package:fox_iot/feature/welcome_page/pres/welcome_page.dart';
import 'package:fox_iot/utils/models/LoadingState.dart';

import '../../../../res/components/background.dart';
import '../../../../res/values/assets.dart';
import '../../../../res/values/s.dart';
import '../../../../res/values/theme.dart';
import '../components/NavigationAnimateRow.dart';
import 'SignUpBloc.dart';

class SignUpPage extends StatefulWidget {
  static const String navId = "sign_up_page";

  @override
  State<StatefulWidget> createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordCheckController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
      final loading = state.loadingState;
      final isPasswordVisible = state.isPasswordVisible;
      final bloc = BlocProvider.of<SignUpBloc>(context);
      if (state.loadingState is LoadingError) {
        Fluttertoast.showToast(
            msg: state.loadingState.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
      return Background(Scaffold(
          backgroundColor: Colors.amber.withOpacity(0),
          body: Stack(children: [
            FractionallySizedBox(
              widthFactor: 1,
              heightFactor: 1,
              child: DecoratedBox(
                  decoration: BoxDecoration(color: FoxIotTheme.colors.tint)),
            ),
            Padding(
                padding: const EdgeInsets.only(
                    top: 24, right: 32, left: 32, bottom: 32),
                child: Center(
                    child: Column(children: [
                  const SizedBox(
                    height: 32,
                  ),
                  NavigationAnimateRow(() {
                    bloc.add(PreviousButtonClick(
                        () => Navigator.pushNamed(context, WelcomePage.navId)));
                  }, () {
                    {
                      bloc.add(NextButtonClick(
                          (userId) => Navigator.pushNamed(
                              context, MainInfoPage.navId,
                              arguments: {"userId": userId}),
                          email: emailController.text,
                          password: passwordController.text,
                          passwordCheck: passwordCheckController.text));
                    }
                  }),
                  const SizedBox(height: 24),
                  DecoratedBox(
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
                              const SizedBox(
                                height: 24,
                              ),
                              TextField(
                                controller: emailController,
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
                                controller: passwordController,
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
                                      onPressed: () {},
                                    ),
                                    hintText: S.of(context).password,
                                    filled: true),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              TextField(
                                controller: passwordCheckController,
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
                                      onPressed: () {},
                                    ),
                                    hintText: S.of(context).password,
                                    filled: true),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                            ],
                          ))),
                ])))
          ])));
    });
  }
}
