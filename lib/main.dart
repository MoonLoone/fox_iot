import 'package:flutter/material.dart';
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
    );
  }
}
