import 'package:flutter/material.dart';
import 'package:fox_iot/res/components/background.dart';
import 'package:fox_iot/res/values/assets.dart';
import 'package:fox_iot/res/values/theme.dart';

class SignInPage extends StatefulWidget {
  static const String navId = "sign_in_page";

  @override
  State<StatefulWidget> createState() => SignInPageState();
}

class SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Background(
        child: Scaffold(
            backgroundColor: Colors.amber.withOpacity(0),
            body: Stack(children: [
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
                            borderRadius:
                                const BorderRadius.all(Radius.circular(32))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            TextField(
                              style: FoxIotTheme.textStyles.primary,
                              decoration: InputDecoration(
                                  fillColor: FoxIotTheme.colors.secondary,
                                  icon: Image.asset(FoxIotTheme
                                      .assets[FoxIotAssetName.email]!.url)),
                            )
                          ],
                        ))),
              )
            ])));
  }
}
