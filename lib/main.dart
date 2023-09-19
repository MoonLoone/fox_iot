import 'package:flutter/material.dart';
import 'package:fox_iot/auth/sign_in_page/pres/SignInPage.dart';
import 'package:fox_iot/auth/sign_up_page/pres/SignUpPage.dart';
import 'package:fox_iot/res/values/s.dart';
import 'package:fox_iot/welcome_page/pres/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: S.supportedLocales,
      locale: S.locale,
      localizationsDelegates: S.localizationDelegates,
      home: WelcomePage(),
      routes: {
        WelcomePage.navId: (context) => const WelcomePage(),
        SignInPage.navId: (context) => SignInPage(),
        SignUpPage.navId: (context) => SignUpPage()
      },
    );
  }
}
