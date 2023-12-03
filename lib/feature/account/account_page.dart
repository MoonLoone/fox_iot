import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../res/components/background.dart';
import '../../res/components/navbar/navbar.dart';
import '../../res/components/navbar/navbar_states.dart';

class AccountPage extends StatefulWidget {
  static const String navId = "account_page";

  @override
  State<StatefulWidget> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Background(Scaffold(
      backgroundColor: Colors.amber.withOpacity(0),
      bottomNavigationBar: FoxNavbar(
        NavbarStates.account,
      ),
      body: Text("Hello from account"),
    ));
  }
}
