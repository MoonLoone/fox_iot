import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fox_iot/res/values/theme.dart';

class Background extends StatelessWidget {
  late StatefulWidget _childWidget;

  Background({super.key, required StatefulWidget child}) {
    _childWidget = child;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
        child: Stack(fit: StackFit.expand, children: [
      Container(
        color: FoxIotTheme.colors.primaryContainer,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
