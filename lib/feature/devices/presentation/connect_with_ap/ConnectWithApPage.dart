import 'package:color_type_converter/exports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fox_iot/feature/devices/presentation/connect_with_ap/ConnectAPActions.dart';
import 'package:fox_iot/feature/devices/presentation/connect_with_ap/ConnectAPBloc.dart';
import 'package:fox_iot/feature/devices/presentation/connect_with_ap/ConnectAPState.dart';
import 'package:fox_iot/res/components/fox_iot_buttons.dart';

import '../../../../res/components/background.dart';
import '../../../../res/values/assets.dart';
import '../../../../res/values/s.dart';
import '../../../../res/values/theme.dart';
import '../../../home/domain/FoxIoTRoom.dart';

class ConnectWithApPage extends StatelessWidget {
  static const String navId = "connect_with_ap";
  final String token;
  final TextEditingController wifiNameController = TextEditingController();
  final TextEditingController wifiPasswordController = TextEditingController();

  ConnectWithApPage(this.token);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ConnectAPBloc>(context);
    return BlocBuilder<ConnectAPBloc, ConnectAPState>(
        builder: (context, state) {
      if (state is InitialState) {
        bloc.add(OnInitWithToken(token));
      }
      return Background(Scaffold(
          backgroundColor: Colors.amber.withOpacity(0),
          body: Center(
              child: Stack(children: [
            FractionallySizedBox(
              widthFactor: 1,
              heightFactor: 1,
              child: DecoratedBox(
                  decoration: BoxDecoration(color: FoxIotTheme.colors.tint)),
            ),
            Padding(
                padding: const EdgeInsets.only(
                    top: 24, right: 32, left: 32, bottom: 32),
                child: Center(
                    child: Column(children: [
                  const SizedBox(height: 24),
                  DecoratedBox(
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const SizedBox(
                                height: 24,
                              ),
                              TextField(
                                controller: wifiNameController,
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
                              TextField(
                                controller: wifiPasswordController,
                                textAlignVertical: TextAlignVertical.center,
                                style: FoxIotTheme.textStyles.primary,
                                decoration: InputDecoration(
                                    fillColor: FoxIotTheme.colors.secondary,
                                    prefixIcon: Image.asset(FoxIotTheme
                                        .assets[FoxIotAssetName.passwordLock]!
                                        .url),
                                    suffixIcon: IconButton(
                                      alignment: Alignment.center,
                                      icon: Image.asset(FoxIotTheme
                                          .assets[FoxIotAssetName.visible]!
                                          .url),
                                      onPressed: () {},
                                    ),
                                    hintText: S.of(context).password,
                                    filled: true),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              DropdownButton<FoxIoTRoom>(
                                value: state.currentRoom ??
                                    state.rooms.firstOrNull,
                                items: state.rooms
                                    .map<DropdownMenuItem<FoxIoTRoom>>(
                                        (device) =>
                                            DropdownMenuItem<FoxIoTRoom>(
                                              value: device,
                                              child: Text(device.name),
                                            ))
                                    .toList(),
                                onChanged: (FoxIoTRoom? value) {
                                  if (value != null) {
                                    bloc.add(ChangeCurrentRoom(value));
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              FoxIoTPrimaryButton(
                                  onClick: () => bloc.add(ConnectClick(
                                      wifiName: wifiNameController.text,
                                      wifiPassword:
                                          wifiPasswordController.text)))
                            ],
                          ))),
                ])))
          ]))));
    });
  }
}
