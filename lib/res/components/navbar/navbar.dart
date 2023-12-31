import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fox_iot/res/components/navbar/navbar_states.dart';
import 'package:fox_iot/res/values/theme.dart';

class FoxNavbar extends StatelessWidget {
  final NavbarStates _navbarState;
  final _navbarStatesList = NavbarStates.values;

  FoxNavbar(this._navbarState, {super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: _navbarStatesList
          .map(
            (e) =>
            BottomNavigationBarItem(
              icon: Image.asset(FoxIotTheme.assets[e.assetName(false)]!.url),
              activeIcon:
              Image.asset(FoxIotTheme.assets[e.assetName(true)]!.url),
              label: e.getName(context),
            ),
      )
          .toList(),
      type: BottomNavigationBarType.fixed,
      backgroundColor: FoxIotTheme.colors.primary,
      selectedLabelStyle: FoxIotTheme.textStyles.primary,
      unselectedFontSize: 12,
      selectedFontSize: 16,
      iconSize: 32,
      currentIndex: _navbarStatesList.indexOf(_navbarState),
      onTap: (int index) {
        Navigator.pushNamed(
            context, _navbarStatesList[index].getNavigationPath());
      },
    );
  }
}
