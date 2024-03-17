import 'package:flutter/material.dart';
import 'package:fox_iot/res/values/assets.dart';
import 'package:fox_iot/res/values/s.dart';
import 'package:fox_iot/res/values/theme.dart';
import 'package:fox_iot/utils/AssetsManipulations.dart';

import '../../../auth/presentation/sign_in_page/SignInPage.dart';
import '../../../auth/presentation/sign_up_page/pres/SignUpPage.dart';

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
                      "lib/res/assets/logo1.png",
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width * 0.4,
                      scale: 0.8,
                    ),
                    const SizedBox(height: 16),
                    FractionallySizedBox(
                      widthFactor: 0.8,
                      child: TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, SignInPage.navId),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                FoxIotTheme.colors.primary),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(20)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16)))),
                        child: Text(
                          S.of(context).signIn,
                          style: TextStyle(
                              color: FoxIotTheme.colors.textPrimary,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    FractionallySizedBox(
                      widthFactor: 0.8,
                      child: TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, SignUpPage.navId),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                FoxIotTheme.colors.primary),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(20)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16)))),
                        child: Text(
                          S.of(context).signUp,
                          style: TextStyle(
                              color: FoxIotTheme.colors.textPrimary,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    //SignUp
                    _SignUsingGoogle(() => {})
                    //Connect using networks
                  ],
                ))),
      )
    ]);
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
        /*InkWell(
            onTap: onClick,
            child: Container(
                decoration: BoxDecoration(
                  color: FoxIotTheme.colors.third,
                  borderRadius: BorderRadius.circular(16.0),
                  border: const Border(),
                ),
                child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                    child: Center(
                      child: Row(children: [
                        Text(
                          "Or connect using",
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
                          child: Image.asset(
                              safetyGetAsset(FoxIotAssetName.google).url),
                        )
                      ]),
                    ))))*/
        );
  }
}
