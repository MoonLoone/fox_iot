import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fox_iot/di/Singleton.dart';
import 'package:fox_iot/feature/account/account_page.dart';
import 'package:fox_iot/feature/auth/domain/models/FoxIoTUser.dart';
import 'package:fox_iot/feature/auth/presentation/sign_up_page/SignUpBloc.dart';
import 'package:fox_iot/feature/home/home_page.dart';
import 'package:fox_iot/feature/rules/rules_page.dart';
import 'package:fox_iot/feature/welcome_page/pres/welcome_page.dart';
import 'package:fox_iot/local_storage/hive/BoxesStorage.dart';
import 'package:fox_iot/local_storage/models/FoxIoTUser.dart';
import 'package:fox_iot/res/values/s.dart';
import 'package:hive/hive.dart';

import 'feature/auth/presentation/sign_in_page/SignInBloc.dart';
import 'feature/auth/presentation/sign_in_page/SignInPage.dart';
import 'feature/auth/presentation/sign_up_page/pres/SignUpPage.dart';
import 'firebase_options.dart';
import 'local_storage/hive/initialization.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializeLocalStorage();
  registerSingletons();
  FoxIoTUser? user = (await Hive.openBox(BoxesStorage.userBoxName))
      .get(BoxesStorage.currentUser);
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
        HomePage.navId: (context) => HomePage(),
        RulesPage.navId: (context) => RulesPage(),
        AccountPage.navId: (context) => AccountPage(),
        SignInPage.navId: (context) => BlocProvider(
              create: (context) => SignInBloc(),
              lazy: true,
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
    return BlocProvider(create: (context) => SignUpBloc(), child: SignUpPage());
  }
}
