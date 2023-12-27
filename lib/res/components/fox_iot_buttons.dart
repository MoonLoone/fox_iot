import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../values/theme.dart';

class FoxIoTPrimaryButton extends StatelessWidget {
  final Widget? trailingItem;
  final Widget? leadingItem;
  final String? btnText;
  final Function() onClick;

  const FoxIoTPrimaryButton(
      this.leadingItem, this.trailingItem, this.btnText, this.onClick,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 240,
        child: TextButton(
            onPressed: () {
              onClick();
            },
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(FoxIotTheme.colors.third),
                padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (trailingItem != null) trailingItem!,
                Text(
                  btnText ?? "",
                  style: FoxIotTheme.textStyles.primary
                      .copyWith(color: FoxIotTheme.colors.onThird),
                ),
                if (leadingItem != null) leadingItem!
              ],
            )));
  }
}
