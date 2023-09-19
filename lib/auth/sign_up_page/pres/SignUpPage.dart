
import 'package:flutter/cupertino.dart';

class SignUpPage extends StatefulWidget {

  static const String navId = "sign_up_page";

  @override
  State<StatefulWidget> createState() => SignUpPageState();

}

class SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Hello from sign up!"));
  }

}