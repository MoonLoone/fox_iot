import 'package:flutter/material.dart';
import 'package:fox_iot/res/components/background.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fox_iot/res/values/s.dart';

class WelcomePage extends StatefulWidget {
  @override
  State createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Background(
        child: Scaffold(
          backgroundColor: Colors.amber.withOpacity(0),
      body: Column(
        children: [
          //Logo
          Image.asset("lib/res/assets/logo1.png"),
          //SignIn
          TextButton(onPressed: () {}, child: Text(S.of(context).signIn)),
          //SignUp
          TextButton(onPressed: () {}, child: Text(S.of(context).signUp)),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 100, height: 2),
              Text(S.of(context).connect_using),
              SizedBox(width: 100, height: 2),
            ],
          ),
          Row(
            children: [],
          )
          //Connect using networks
        ],
      ),
    ));
  }
}
