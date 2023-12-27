import 'package:flutter/material.dart';
import 'package:fox_iot/res/components/background.dart';
import 'package:fox_iot/feature/welcome_page/pres/components/welcome_dialog.dart';

class WelcomePage extends StatefulWidget {

  static const String navId = "welcome_page";

  const WelcomePage({super.key});

  @override
  State createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        backgroundColor: Colors.amber.withOpacity(0),
        body: WelcomeDialog(),
      ),
    );
  }
}
