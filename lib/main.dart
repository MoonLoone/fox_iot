import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fox_iot/feature/auth/presentation/sign_up_page/SignUpBloc.dart';
import 'package:fox_iot/di/Singleton.dart';
import 'package:fox_iot/res/values/s.dart';
import 'package:fox_iot/feature/welcome_page/pres/welcome_page.dart';

import 'feature/auth/presentation/sign_in_page/SignInBloc.dart';
import 'feature/auth/presentation/sign_in_page/pres/SignInPage.dart';
import 'feature/auth/presentation/sign_up_page/pres/SignUpPage.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      home:  const WelcomePage(),
      routes: {
        WelcomePage.navId: (context) => const WelcomePage(),
        SignInPage.navId: (context) => BlocProvider(
              create: (context) => SignInBloc(),
              child: SignInPage(),
            ),
        SignUpPage.navId: (context) => BlocProvider(
          create: (context) => SignUpBloc(),
          child: SignUpPage(),
        )
      },
    );
  }
}
