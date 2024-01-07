import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fox_iot/di/Singleton.dart';
import 'package:fox_iot/feature/auth/domain/models/FoxIoTUser.dart';
import 'package:fox_iot/feature/auth/presentation/sign_up_page/SignUpBloc.dart';
import 'package:fox_iot/feature/welcome_page/pres/welcome_page.dart';
import 'package:fox_iot/res/values/s.dart';

import 'feature/auth/presentation/sign_in_page/SignInBloc.dart';
import 'feature/auth/presentation/sign_in_page/pres/SignInPage.dart';
import 'feature/auth/presentation/sign_up_page/pres/SignUpPage.dart';
import 'firebase_options.dart';
import 'local_storage/boxes/FoxUserBox.dart';
import 'local_storage/hive/initialization.dart';

Future<void> main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  initializeLocalStorage();
  registerSingletons();
  FoxIoTUser? user = (await FoxUserBox().box).get(FoxUserBox.currentUser);
  runApp(FoxIoTApp(currentUser: user));
}

class FoxIoTApp extends StatelessWidget {
  final FoxIoTUser? currentUser;

  const FoxIoTApp({super.key, this.currentUser});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: S.supportedLocales,
      locale: S.locale,
      localizationsDelegates: S.localizationDelegates,
      home: _getStartWidget(),
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

  Widget _getStartWidget() {
    if (currentUser == null) return const WelcomePage();
    //TODO navigate to main page
    return BlocProvider(
      create: (context) => SignUpBloc(),
      child: SignUpPage(),
    );
  }
}
