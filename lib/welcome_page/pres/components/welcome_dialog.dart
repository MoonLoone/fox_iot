import 'package:flutter/material.dart';
import 'package:fox_iot/res/values/assets.dart';
import 'package:fox_iot/res/values/s.dart';
import 'package:fox_iot/res/values/theme.dart';

import '../../../auth/presentation/sign_in_page/pres/SignInPage.dart';
import '../../../auth/presentation/sign_up_page/pres/SignUpPage.dart';

class WelcomeDialog extends StatelessWidget {
  const WelcomeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: DecoratedBox(
            decoration: BoxDecoration(color: FoxIotTheme.colors.tint)),
      ),
      Center(
        child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.8,
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
                    //SignIn
                    TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, SignInPage.navId),
                      style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(Size(
                              MediaQuery.of(context).size.width * 0.4, 56)),
                          maximumSize: MaterialStateProperty.all(Size(
                              MediaQuery.of(context).size.width * 0.4, 100)),
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
                            fontSize: 24),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, SignUpPage.navId),
                      style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(Size(
                              MediaQuery.of(context).size.width * 0.4, 56)),
                          maximumSize: MaterialStateProperty.all(Size(
                              MediaQuery.of(context).size.width * 0.4, 100)),
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
                            fontSize: 24),
                      ),
                    ),
                    const SizedBox(height: 20),
                    //SignUp
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: Container(
                            decoration: BoxDecoration(
                                color: FoxIotTheme.colors.textSecondary),
                            height: 1,
                          ),
                        )),
                        Text(
                          S.of(context).connect_using,
                          style: FoxIotTheme.textStyles.primary,
                        ),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: Container(
                            decoration: BoxDecoration(
                                color: FoxIotTheme.colors.textSecondary),
                            height: 1,
                          ),
                        )),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                            FoxIotTheme.assets[FoxIotAssetName.facebook]!.url),
                        Image.asset(
                            FoxIotTheme.assets[FoxIotAssetName.facebook]!.url),
                        Image.asset(
                            FoxIotTheme.assets[FoxIotAssetName.facebook]!.url),
                      ],
                    )
                    //Connect using networks
                  ],
                ))),
      )
    ]);
  }
}
