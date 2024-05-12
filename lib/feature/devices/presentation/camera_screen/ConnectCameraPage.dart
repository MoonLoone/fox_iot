import 'package:flutter/material.dart';
import 'package:fox_iot/feature/devices/data/validator.dart';
import 'package:fox_iot/feature/devices/domain/IDeviceRepo.dart';
import 'package:fox_iot/feature/devices/presentation/devices_list/devices_page.dart';
import 'package:fox_iot/res/components/background.dart';
import 'package:fox_iot/res/components/fox_iot_buttons.dart';
import 'package:get_it/get_it.dart';

import '../../../../res/values/assets.dart';
import '../../../../res/values/s.dart';
import '../../../../res/values/theme.dart';

class ConnectCameraPage extends StatefulWidget {
  static const String navId = "camera_connect_page";

  @override
  State<StatefulWidget> createState() => _ConnectCameraState();
}

class _ConnectCameraState extends State<ConnectCameraPage> {
  final TextEditingController urlController = TextEditingController();
  final IDeviceRepo _repo = GetIt.I.get<IDeviceRepo>();

  bool restrictionVisible = true;
  bool error = false;

  void changeState({bool? attention, bool? error}) => setState(() {
        restrictionVisible = attention ?? restrictionVisible;
        error = error ?? this.error;
      });

  @override
  Widget build(BuildContext context) {
    if (restrictionVisible) return attention();
    if (error) return errorView();
    return connectDialog();
  }

  Widget attention() => Background(Stack(children: [
        FractionallySizedBox(
          widthFactor: 1,
          heightFactor: 1,
          child: DecoratedBox(
              decoration: BoxDecoration(color: FoxIotTheme.colors.tint)),
        ),
        Center(
            child: FractionallySizedBox(
                widthFactor: 0.7,
                heightFactor: 0.6,
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: FoxIotTheme.colors.primaryContainer,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(32))),
                    child: Padding(
                        padding: const EdgeInsets.only(
                          left: 32,
                          right: 32,
                        ),
                        child: Column(
                          children: [
                            Text(
                                "Приложение поддерживает только камеры с предоставляемым провайдером url-адресом"),
                            FoxIoTPrimaryButton(
                                btnText: S.of(context).signIn,
                                onClick: () => changeState(attention: false))
                          ],
                        )))))
      ]));

  Widget connectDialog() => Background(Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.amber.withOpacity(0),
      body: Stack(children: [
        FractionallySizedBox(
          widthFactor: 1,
          heightFactor: 1,
          child: DecoratedBox(
              decoration: BoxDecoration(color: FoxIotTheme.colors.tint)),
        ),
        Center(
          child: FractionallySizedBox(
              widthFactor: 0.7,
              heightFactor: 0.6,
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: FoxIotTheme.colors.primaryContainer,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(32))),
                  child: Padding(
                      padding: const EdgeInsets.only(
                        left: 32,
                        right: 32,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const SizedBox(
                                height: 16,
                              ),
                              TextField(
                                controller: urlController,
                                style: FoxIotTheme.textStyles.primary,
                                decoration: InputDecoration(
                                  fillColor: FoxIotTheme.colors.secondary,
                                  prefixIcon: Image.asset(FoxIotTheme
                                      .assets[FoxIotAssetName.email]!.url),
                                  hintText: S.of(context).e_mail,
                                  filled: true,
                                ),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              FoxIoTPrimaryButton(
                                  btnText: S.of(context).signIn,
                                  onClick: () {
                                    final validateUrl =
                                        validateCameraUrl(urlController.text);
                                    if (validateUrl) {
                                      _repo
                                          .saveCameraUrl(urlController.text)
                                          .whenComplete(() =>
                                              Navigator.pushNamed(
                                                  context, DevicesPage.navId));
                                    } else {
                                      changeState(error: true);
                                    }
                                  })
                            ]),
                      )))),
        )
      ])));

  Widget errorView() => Background(Stack(children: [
        FractionallySizedBox(
          widthFactor: 1,
          heightFactor: 1,
          child: DecoratedBox(
              decoration: BoxDecoration(color: FoxIotTheme.colors.tint)),
        ),
        Center(
            child: FractionallySizedBox(
                widthFactor: 0.7,
                heightFactor: 0.6,
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: FoxIotTheme.colors.primaryContainer,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(32))),
                    child: Padding(
                        padding: const EdgeInsets.only(
                          left: 32,
                          right: 32,
                        ),
                        child: Column(
                          children: [
                            Text("Ошибка, невалидный url"),
                            FoxIoTPrimaryButton(
                                btnText: S.of(context).signIn,
                                onClick: () => changeState(error: false))
                          ],
                        )))))
      ]));
}
