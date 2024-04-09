import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fox_iot/feature/devices/domain/IDeviceRepo.dart';
import 'package:fox_iot/res/components/FoxTextFields.dart';
import 'package:fox_iot/res/components/fox_iot_buttons.dart';
import 'package:get_it/get_it.dart';

class ConnectCameraPage extends StatelessWidget {
  final TextEditingController enterUrlTextField = TextEditingController();
  final IDeviceRepo _deviceRepo = GetIt.I.get<IDeviceRepo>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            FoxIoTTextField(
              controller: enterUrlTextField,
              hintText: "Put your url this",
            ),
            SizedBox(height: 16),
            FoxIoTPrimaryButton(onClick: () => _deviceRepo)
          ],
        ),
      ),
    );
  }
}
