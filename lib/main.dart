import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fox_iot/auth/sign_in_page/SignInBloc.dart';
import 'package:fox_iot/auth/sign_in_page/pres/SignInPage.dart';
import 'package:fox_iot/auth/sign_up_page/pres/SignUpPage.dart';
import 'package:fox_iot/di/Singleton.dart';
import 'package:fox_iot/res/values/s.dart';
import 'package:fox_iot/welcome_page/pres/welcome_page.dart';

void main() {
  registerSingletons();
  runApp(const FoxIoTApp());
}

class FoxIoTApp extends StatelessWidget {
  const FoxIoTApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: S.supportedLocales,
      locale: S.locale,
      localizationsDelegates: S.localizationDelegates,
      home: const WelcomePage(),
      routes: {
        WelcomePage.navId: (context) => const WelcomePage(),
        SignInPage.navId: (context) => BlocProvider(
              create: (context) => SignInBloc(),
              child: SignInPage(),
            ),
        SignUpPage.navId: (context) => SignUpPage()
      },
    );
  }
}
