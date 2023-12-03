import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fox_iot/di/Singleton.dart';
import 'package:fox_iot/feature/account/account_page.dart';
import 'package:fox_iot/feature/auth/presentation/sign_up_page/SignUpBloc.dart';
import 'package:fox_iot/feature/devices/presentation/devices_bloc.dart';
import 'package:fox_iot/feature/devices/presentation/devices_page.dart';
import 'package:fox_iot/feature/hardware_adapters/bluetooth/presentation/bluetooth_devices_bloc.dart';
import 'package:fox_iot/feature/hardware_adapters/bluetooth/presentation/bluetooth_devices_page.dart';
import 'package:fox_iot/feature/home/home_page.dart';
import 'package:fox_iot/feature/rules/rules_page.dart';
import 'package:fox_iot/feature/welcome_page/pres/welcome_page.dart';
import 'package:fox_iot/res/values/s.dart';

import 'feature/auth/presentation/sign_in_page/SignInBloc.dart';
import 'feature/auth/presentation/sign_in_page/SignInPage.dart';
import 'feature/auth/presentation/sign_up_page/pres/SignUpPage.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
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
      home: WelcomePage(), //HomePage(), //const WelcomePage(),
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
              lazy: true,
              child: SignUpPage(),
            ),
        DevicesPage.navId: (context) => BlocProvider(
              create: (context) => DevicesBloc(),
              lazy: true,
              child: const DevicesPage(),
            ),
        BlueDevicesPage.navId: (context) => BlocProvider(
              create: (context) => BluetoothDevicesBloc(),
              lazy: true,
              child: const BlueDevicesPage(),
            ),
      },
    );
  }
}
