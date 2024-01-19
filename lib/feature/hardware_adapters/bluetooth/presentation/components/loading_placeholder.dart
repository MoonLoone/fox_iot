import 'package:flutter/material.dart';
import 'package:fox_iot/res/values/assets.dart';
import 'package:fox_iot/res/values/theme.dart';
import 'package:fox_iot/utils/models/LoadingState.dart';

class LoadingPlaceholder extends StatelessWidget {
  final LoadingState loadingsState;

  const LoadingPlaceholder(
      {super.key, this.loadingsState = const NotLoading()});

  @override
  Widget build(BuildContext context) {
    Widget? placeHolderWidget;
    switch (loadingsState) {
      case Loading():
        placeHolderWidget = CircularProgressIndicator(
          color: FoxIotTheme.colors.primary,
        );
      case NotLoading():
        placeHolderWidget = Image.asset(
            FoxIotTheme.assets[FoxIotAssetName.bluetooth]?.url ??
                FoxIotTheme.assets.values.first.url);
      case LoadingError():
        placeHolderWidget = Image.asset(
            FoxIotTheme.assets[FoxIotAssetName.errorSearch]?.url ??
                FoxIotTheme.assets.values.first.url);
    }
    return SizedBox(
        width: 128, height: 128, child: Center(child: placeHolderWidget));
  }
}
