
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../res/values/assets.dart';
import '../../../../res/values/theme.dart';
import '../../../../utils/AssetsManipulations.dart';

class NavigationAnimateRow extends StatefulWidget {
  final Function() backNavigate;
  final Function() nextNavigate;

  const NavigationAnimateRow(this.backNavigate, this.nextNavigate);

  @override
  State<StatefulWidget> createState() =>
      _NavigationAnimateRowState(backNavigate, nextNavigate);
}

class _NavigationAnimateRowState extends State<NavigationAnimateRow>
    with SingleTickerProviderStateMixin {
  bool _isRightDirection = false;
  final Function() backNavigate;
  final Function() nextNavigate;
  late AnimationController _controller;
  late Animation<Offset> _animation;

  _NavigationAnimateRowState(this.backNavigate, this.nextNavigate);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )
      ..repeat(reverse: true)
      ..addStatusListener((status) {
        setState(() {
          _isRightDirection = !(status == AnimationStatus.forward);
        });
      });

    _animation = Tween<Offset>(
      begin: const Offset(0.5, 0.0),
      end: const Offset(7.5, 0.0),
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                _CircularArrowButton(backNavigate, true),
                SlideTransition(
                  position: _animation,
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..scale(_isRightDirection ? -1.0 : 1.0, 1.0, 1.0),
                    child: Image.asset(
                        safetyGetAsset(FoxIotAssetName.signUpFoxGif).url,
                        height: 125.0),
                  ),
                ),
              ],
            ),
            _CircularArrowButton(nextNavigate, false),
          ],
        ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _CircularArrowButton extends StatelessWidget {
  final Function() onClick;
  final bool isBackDirection;

  const _CircularArrowButton(this.onClick, this.isBackDirection);

  @override
  Widget build(BuildContext context) {
    Icon? icon;
    if (isBackDirection) {
      icon = const Icon(Icons.arrow_back);
    } else {
      icon = const Icon(Icons.arrow_forward);
    }
    return GestureDetector(
        onTap: onClick,
        child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
                color: FoxIotTheme.colors.primary,
                shape: BoxShape.circle,
                border: Border.all()),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: icon,
            )));
  }
}
