import 'package:flutter/material.dart';

import '../values/theme.dart';

class FoxIoTTextField extends StatelessWidget {
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final Widget? postfixIcon;
  final String? hintText;

  const FoxIoTTextField(
      {this.controller, this.prefixIcon, this.postfixIcon, this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: FoxIotTheme.textStyles.primary,
      decoration: InputDecoration(
          fillColor: FoxIotTheme.colors.secondary,
          prefixIcon: prefixIcon,
          suffixIcon: postfixIcon,
          hintText: hintText,
          filled: true),
    );
  }
}
