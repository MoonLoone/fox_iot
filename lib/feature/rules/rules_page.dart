import 'package:flutter/material.dart';

import '../../res/components/background.dart';
import '../../res/components/navbar/navbar.dart';
import '../../res/components/navbar/navbar_states.dart';

class RulesPage extends StatefulWidget {
  static const String navId = "rules_page";

  @override
  State<StatefulWidget> createState() => _RulesPageState();
}

class _RulesPageState extends State<RulesPage> {
  @override
  Widget build(BuildContext context) {
    return Background(Scaffold(
      backgroundColor: Colors.amber.withOpacity(0),
      bottomNavigationBar: FoxNavbar(
        NavbarStates.rules,
      ),
      body: Text("Hello from rules"),
    ));
  }
}
