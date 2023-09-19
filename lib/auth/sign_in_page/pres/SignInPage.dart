import 'package:flutter/cupertino.dart';

class SignInPage extends StatefulWidget {

  static const String navId = "sign_in_page";

  @override
  State<StatefulWidget> createState() => SignInPageState();

}

class SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Hello from sign in!"));
  }

}