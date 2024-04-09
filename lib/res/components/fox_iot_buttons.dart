import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../values/theme.dart';

class FoxIoTPrimaryButton extends StatelessWidget {
  final Widget? trailingItem;
  final Widget? leadingItem;
  final String? btnText;
  final Function() onClick;

  const FoxIoTPrimaryButton(
      {this.leadingItem, this.trailingItem, this.btnText, required this.onClick,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: TextButton(
            onPressed: () {
              onClick();
            },
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(FoxIotTheme.colors.third),
                padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 12)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (trailingItem != null) trailingItem!,
                Text(
                  btnText ?? "",
                  style: FoxIotTheme.textStyles.h4
                      .copyWith(color: FoxIotTheme.colors.onThird),
                ),
                //if (leadingItem != null) leadingItem!
              ],
            )));
  }
}
