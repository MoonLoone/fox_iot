import 'package:color_type_converter/exports.dart';
import 'package:fox_iot/res/components/FoxTextFields.dart';
import 'package:fox_iot/res/components/fox_iot_buttons.dart';

import '../../../../../res/values/theme.dart';

class AddRoomDialog extends StatelessWidget {
  final Function(String) onApplyClick;
  final TextEditingController nameController = TextEditingController();

  AddRoomDialog(this.onApplyClick);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      FractionallySizedBox(
        widthFactor: 1,
        heightFactor: 1,
        child: DecoratedBox(
            decoration: BoxDecoration(color: FoxIotTheme.colors.tint)),
      ),
      Center(
        child: FractionallySizedBox(
            widthFactor: 0.7,
            heightFactor: 0.85,
            child: DecoratedBox(
                decoration: BoxDecoration(
                    color: FoxIotTheme.colors.primaryContainer,
                    borderRadius: const BorderRadius.all(Radius.circular(32))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FoxIoTTextField(controller: nameController),
                    FoxIoTPrimaryButton(
                        onClick: () => onApplyClick(nameController.text))
                  ],
                ))),
      )
    ]);
  }
}
