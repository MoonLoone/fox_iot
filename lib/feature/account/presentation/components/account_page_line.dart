import 'package:flutter/material.dart';
import 'package:fox_iot/res/values/theme.dart';

class AccountPageLine extends StatelessWidget {
  final String text;
  final Image? leadingImg;
  final Image? finalImg;

  const AccountPageLine(
      {super.key,
      required this.text,
      required this.leadingImg,
      required this.finalImg});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
        child: Container(
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              color: FoxIotTheme.colors.secondary,
            ),
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      children: [
                        if (leadingImg != null) leadingImg!,
                        const SizedBox(
                          width: 16,
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                            bottom: 5, // Space between underline and text
                          ),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                            color: Colors.black,
                            width: 1.0, // Underline thickness
                          ))),
                          child: Text(
                            text,
                            style: FoxIotTheme.textStyles.primary,
                          ),
                        ),
                      ],
                    ),
                    if (finalImg != null) finalImg! else const SizedBox()
                  ],
                ))));
  }
}
