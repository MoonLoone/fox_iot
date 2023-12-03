import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fox_iot/res/values/theme.dart';

class Background extends StatelessWidget {
  final StatefulWidget _childWidget;

  Background(this._childWidget, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
        child: Stack(fit: StackFit.expand, children: [
          Container(
            color: FoxIotTheme.colors.primaryContainer,
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: MediaQuery
                .of(context)
                .size
                .height,
          ),
          FractionallySizedBox(
            alignment: Alignment.topLeft,
            widthFactor: 1,
            heightFactor: 0.5,
            child: Container(
              decoration: BoxDecoration(
                  color: FoxIotTheme.colors.primary,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32))),
            ),
          ),
          _childWidget
        ]));
  }
}
