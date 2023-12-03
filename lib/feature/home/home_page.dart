import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../res/components/background.dart';
import '../../res/components/navbar/navbar.dart';
import '../../res/components/navbar/navbar_states.dart';

class HomePage extends StatefulWidget {
  static const String navId = "home_page";

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Background(Scaffold(
      backgroundColor: Colors.amber.withOpacity(0),
      bottomNavigationBar: FoxNavbar(
        NavbarStates.home,
      ),
      body: Text("Hello from home"),
    ));
  }
}
