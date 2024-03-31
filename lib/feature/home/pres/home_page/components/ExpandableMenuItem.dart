
import 'package:flutter/cupertino.dart';

class ExpandableMenuItem extends StatelessWidget{

  final String text;

  const ExpandableMenuItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }

}
