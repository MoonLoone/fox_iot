import 'package:flutter/material.dart';
import 'package:fox_iot/res/values/assets.dart';
import 'package:fox_iot/res/values/s.dart';
import 'package:fox_iot/res/values/theme.dart';
import 'package:fox_iot/utils/AssetsManipulations.dart';

import '../../../auth/presentation/sign_in_page/SignInPage.dart';
import '../../../auth/presentation/sign_up_page/SignUpPage.dart';

class WelcomeDialog extends StatelessWidget {
  const WelcomeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      FractionallySizedBox(
        widthFactor: 1,
        heightFactor: 1,
        child: DecoratedBox(
            decoration: BoxDecoration(color: FoxIotTheme.colors.tint)),
      ),
      Center(
        child: FractionallySizedBox(
            widthFactor: 0.7,
            heightFactor: 0.85,
            child: DecoratedBox(
                decoration: BoxDecoration(
                    color: FoxIotTheme.colors.primaryContainer,
                    borderRadius: const BorderRadius.all(Radius.circular(32))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [

                    //Logo
                    Image.asset(
                      safetyGetAsset(FoxIotAssetName.logo1).url,
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width * 0.4,
                      scale: 0.8,
                    ),
                    const SizedBox(height: 16),
                    _SignInOutButton(
                        () => Navigator.pushNamed(context, SignInPage.navId),
                        S.of(context).signIn),
                    const SizedBox(height: 16),
                    _SignInOutButton(
                        () => Navigator.pushNamed(context, SignUpPage.navId),
                        S.of(context).signUp),
                    const SizedBox(height: 20),
                    _SignUsingGoogle(() => {})
                  ],
                ))),
      )
    ]);
  }
}

class _SignInOutButton extends StatelessWidget {
  final Function() onClick;
  final String text;

  const _SignInOutButton(this.onClick, this.text);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.8,
      child: TextButton(
        onPressed: onClick,
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(FoxIotTheme.colors.primary),
            padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)))),
        child: Text(
          text,
          style: FoxIotTheme.textStyles.h4,
        ),
      ),
    );
  }
}

class _SignUsingGoogle extends StatelessWidget {
  final Function() onClick;

  const _SignUsingGoogle(this.onClick);

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
        child: TextButton(
            onPressed: () => onClick,
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(FoxIotTheme.colors.third),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 8)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)))),
            child: Row(children: [
              Text(
                S.of(context).or_connect_using,
                textAlign: TextAlign.center,
                style: FoxIotTheme.textStyles.primary
                    .copyWith(color: FoxIotTheme.colors.onThird),
              ),
              const SizedBox(width: 8),
              Container(
                width: 32.0,
                height: 32.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: FoxIotTheme.colors.primaryContainer,
                ),
                child: Image.asset(safetyGetAsset(FoxIotAssetName.google).url),
              )
            ]))
        );
  }
}
