import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fox_iot/di/Singleton.dart';
import 'package:fox_iot/feature/account/account_page.dart';
import 'package:fox_iot/feature/auth/presentation/main_info_page/MainInfoPage.dart';
import 'package:fox_iot/feature/auth/presentation/sign_up_page/SignUpBloc.dart';
import 'package:fox_iot/feature/devices/presentation/connect_with_ap/ConnectAPActions.dart';
import 'package:fox_iot/feature/devices/presentation/connect_with_ap/ConnectAPBloc.dart';
import 'package:fox_iot/feature/devices/presentation/connect_with_ap/ConnectWithApPage.dart';
import 'package:fox_iot/feature/devices/presentation/connect_zigbee_sub/ConnectZigbeeActions.dart';
import 'package:fox_iot/feature/devices/presentation/connect_zigbee_sub/ConnectZigbeeBloc.dart';
import 'package:fox_iot/feature/devices/presentation/connect_zigbee_sub/ConnectZigbeePage.dart';
import 'package:fox_iot/feature/devices/presentation/get_token/GetTokenBloc.dart';
import 'package:fox_iot/feature/devices/presentation/get_token/GetTokenPage.dart';
import 'package:fox_iot/feature/devices/presentation/select_device_to_connect/SelectDeviceToConnectPage.dart';
import 'package:fox_iot/feature/devices/presentation/thermo_screen/ThermoPage.dart';
import 'package:fox_iot/feature/home/pres/create_home_page/CreateHomeBloc.dart';
import 'package:fox_iot/feature/home/pres/create_home_page/CreateHomePage.dart';
import 'package:fox_iot/feature/home/pres/home_page/HomeBloc.dart';
import 'package:fox_iot/feature/home/pres/home_page/HomePage.dart';
import 'package:fox_iot/feature/rules/rules_page.dart';
import 'package:fox_iot/feature/welcome_page/pres/welcome_page.dart';
import 'package:fox_iot/local_storage/domain/IFoxIoTUserDb.dart';
import 'package:fox_iot/res/values/s.dart';
import 'package:fox_iot/utils/IFoxIoTActions.dart';
import 'package:get_it/get_it.dart';

import 'feature/auth/presentation/main_info_page/MainInfoBloc.dart';
import 'feature/auth/presentation/sign_in_page/SignInBloc.dart';
import 'feature/auth/presentation/sign_in_page/SignInPage.dart';
import 'feature/auth/presentation/sign_up_page/SignUpPage.dart';
import 'feature/devices/presentation/devices_list/devices_bloc.dart';
import 'feature/devices/presentation/devices_list/devices_page.dart';
import 'firebase_options.dart';
import 'local_storage/data/hive/initialization.dart';
import 'local_storage/domain/models/FoxIoTUser.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializeLocalStorage();
  await registerSingletons();
  FoxIoTUser? currentUser = await GetIt.I.get<IFoxIoTUserDb>().getCurrentUser();
  runApp(FoxIoTApp(
    currentUser: currentUser,
  ));
}

class FoxIoTApp extends StatelessWidget {
  final FoxIoTUser? currentUser;

  const FoxIoTApp({this.currentUser, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: S.supportedLocales,
      locale: S.locale,
      localizationsDelegates: S.localizationDelegates,
      home: _getStartWidget(currentUser),
      routes: {
        WelcomePage.navId: (context) => const WelcomePage(),
        SelectDeviceToConnectPage.navId: (context) =>
            SelectDeviceToConnectPage(),
        HomePage.navId: (context) => BlocProvider(
              create: (_) => HomePageBloc()..add(OnInit()),
              lazy: true,
              child: HomePage(),
            ),
        RulesPage.navId: (context) => RulesPage(),
        AccountPage.navId: (context) => const AccountPage(),
        SignInPage.navId: (context) => BlocProvider(
              create: (context) => SignInBloc(),
              lazy: true,
              child: SignInPage(),
            ),
        SignUpPage.navId: (context) => BlocProvider(
              create: (context) => SignUpBloc(),
              child: SignUpPage(),
            ),
        DevicesPage.navId: (context) => BlocProvider(
              create: (context) => DevicesBloc()..add(OnInit()),
              lazy: true,
              child: DevicesPage(),
            ),
        GetTokenPage.navId: (context) => BlocProvider(
              create: (context) => GetTokenBloc()..add(OnInit()),
              lazy: true,
              child: GetTokenPage(),
            ),
        MainInfoPage.navId: (context) => BlocProvider(
              create: (context) => MainInfoBloc(),
              lazy: true,
              child: MainInfoPage(),
            ),
        CreateHomePage.navId: (context) => BlocProvider(
              create: (context) => CreateHomeBloc(),
              lazy: true,
              child: CreateHomePage(),
            ),
        ConnectWithApPage.navId: (context) => BlocProvider(
              create: (context) => ConnectAPBloc(),
              lazy: true,
              child: ConnectWithApPage(
                  ModalRoute.of(context)!.settings.arguments.toString()),
            ),
        ConnectZigbeePage.navId: (context) => BlocProvider(
              create: (context) => ConnectZigbeeBloc()..add(OnInit()),
              lazy: true,
              child: ConnectZigbeePage(),
            ),
        ThermoPage.navId: (context) =>
            ThermoPage(ModalRoute.of(context)!.settings.arguments.toString()),
      },
    );
  }

  Widget _getStartWidget(FoxIoTUser? currentUser) {
    if (currentUser == null) return const WelcomePage();
    //TODO navigate to main page
    return BlocProvider(
      create: (context) => HomePageBloc()..add(OnInit()),
      lazy: true,
      child: HomePage(),
    );
  }
}
