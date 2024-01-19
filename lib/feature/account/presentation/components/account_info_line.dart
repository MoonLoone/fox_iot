import 'package:flutter/cupertino.dart';
import 'package:fox_iot/res/values/theme.dart';

class AccountInfoLine extends StatelessWidget {
  final String trailingImageUrl;
  final String text;

  const AccountInfoLine(this.trailingImageUrl, this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Image.asset(
        trailingImageUrl,
        width: FoxIotTheme.sizes.primaryIconSize.width,
        height: FoxIotTheme.sizes.primaryIconSize.height,
        alignment: Alignment.center,
        fit: BoxFit.fill,
      ),
      Text(text, style: FoxIotTheme.textStyles.primary
          .copyWith(fontWeight: FontWeight.bold))
    ]);
  }
}
