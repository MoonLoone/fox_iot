import 'package:flutter/cupertino.dart';

class AccountPageLine extends StatelessWidget {
  final String text;
  final Image? leadingImgId;
  final Image? finalImgId;

  const AccountPageLine(
      {super.key,
      required this.text,
      required this.leadingImgId,
      required this.finalImgId});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (leadingImgId != null) leadingImgId!,
        Text(text),
        if (finalImgId != null) finalImgId!
      ],
    );
  }
}
