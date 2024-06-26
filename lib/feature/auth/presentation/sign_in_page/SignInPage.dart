import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fox_iot/feature/home/pres/home_page/HomePage.dart';
import 'package:fox_iot/feature/welcome_page/pres/welcome_page.dart';
import 'package:fox_iot/res/components/background.dart';
import 'package:fox_iot/res/components/fox_iot_buttons.dart';
import 'package:fox_iot/res/values/assets.dart';
import 'package:fox_iot/res/values/theme.dart';
import 'package:fox_iot/utils/AssetsManipulations.dart';

import '../../../../res/values/s.dart';
import 'SignInBloc.dart';
import 'SignInContracts.dart';

class SignInPage extends StatefulWidget {
  static const String navId = "sign_in_page";

  @override
  State<StatefulWidget> createState() => SignInPageState();
}

class SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
      final loading = state.loadingState;
      final isPasswordVisible = state.isPasswordVisible;
      final SignInBloc signInBloc = BlocProvider.of<SignInBloc>(context);
      return Background(Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.amber.withOpacity(0),
          body: Stack(children: [
            FractionallySizedBox(
              widthFactor: 1,
              heightFactor: 1,
              child: DecoratedBox(
                  decoration: BoxDecoration(color: FoxIotTheme.colors.tint)),
            ),
            Center(
                child: FractionallySizedBox(
              widthFactor: 0.7,
              heightFactor: 0.6,
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
                      child: SingleChildScrollView(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _BackButton(() => {
                                    Navigator.pushNamed(
                                        context, WelcomePage.navId)
                                  }),
                              Text(
                                S.of(context).signIn,
                                style: FoxIotTheme.textStyles.h2,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox()
                            ],
                          ),
                          const SizedBox(
                            height: 16,
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
                                    .assets[FoxIotAssetName.passwordLock]!.url),
                                suffixIcon: IconButton(
                                  alignment: Alignment.center,
                                  icon: Image.asset(FoxIotTheme
                                      .assets[FoxIotAssetName.visible]!.url),
                                  onPressed: () {
                                    signInBloc.add(VisibleIconClick());
                                  },
                                ),
                                hintText: S.of(context).password,
                                filled: true),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          FoxIoTPrimaryButton(
                              btnText: S.of(context).signIn,
                              onClick: () => signInBloc.add(SignInClick(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  navigateWhenAuth: () {
                                    Navigator.pushNamed(
                                        context, HomePage.navId);
                                  }))),
                          const SizedBox(
                            height: 32,
                          ),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: S.of(context).forgot_password,
                                style: FoxIotTheme.textStyles.primary.copyWith(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {}),
                            //todo Forgot password
                          ]))
                        ],
                      )))),
            ))
          ])));
    });
  }
}

class _BackButton extends StatelessWidget {
  final Function() onClick;

  const _BackButton(this.onClick);

  @override
  Widget build(BuildContext context) {
    FoxIoTAsset backAsset = safetyGetAsset(FoxIotAssetName.back);
    return GestureDetector(
        onTap: onClick,
        child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
                color: FoxIotTheme.colors.third,
                shape: BoxShape.circle,
                border: Border.all()),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: SvgPicture.asset(
                backAsset.url,
                width: backAsset.size.width,
                height: backAsset.size.width,
              ),
            )));
  }
}
