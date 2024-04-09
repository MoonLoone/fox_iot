import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fox_iot/feature/devices/presentation/connect_zigbee_sub/ConnectZigbeeActions.dart';
import 'package:fox_iot/feature/devices/presentation/connect_zigbee_sub/ConnectZigbeeBloc.dart';
import 'package:fox_iot/feature/devices/presentation/connect_zigbee_sub/ConnectZigbeeState.dart';
import 'package:fox_iot/res/components/fox_iot_buttons.dart';
import 'package:fox_iot/utils/models/LoadingState.dart';

import '../../../../res/values/assets.dart';
import '../../../../res/values/theme.dart';
import '../../../../utils/AssetsManipulations.dart';
import '../../domain/models/Device.dart';

class ConnectZigbeePage extends StatelessWidget {
  static const String navId = "connect_zigbee_sub";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectZigbeeBloc, ConnectZigbeeState>(
        builder: (context, state) {
      final bloc = BlocProvider.of<ConnectZigbeeBloc>(context);
      switch (state.loading) {
        case (Loading()):
          return loadingScreen(context);
        case (LoadingError()):
          return errorScreen();
        case (NotLoading()):
          return selectHub(
              () => bloc.add(OnStartConnectingClick(state.currentGW?.id)),
              (newGw) => bloc.add(OnChangeCurrentGW(newGw)),
              state.gws,
              state.currentGW,
              context);
        case (SuccessLoading()):
          return successScreen();
      }
      return errorScreen();
    });
  }

  Widget loadingScreen(BuildContext context) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Hub device",
            style: FoxIotTheme.textStyles.h3,
          ),
          leading: InkWell(
              child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: SvgPicture.asset(
                    safetyGetAsset(FoxIotAssetName.backBtn).url,
                    width: 48,
                    height: 48,
                    color: Colors.black,
                  )),
              onTap: () => Navigator.pop(context)),
          centerTitle: true,
        ),
        body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Connecting to device...",
                    style: FoxIotTheme.textStyles.primary,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const SizedBox(
                    width: 128,
                    height: 128,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            )),
      );

  Widget successScreen() {
    return Text("Success");
  }

  Widget errorScreen() {
    return Text("Error");
  }

  Widget selectHub(Function() startConnecting, Function(Device) changeGW,
      List<Device> gws, Device? currentGWS, BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Select Zigbee hub"),
          SizedBox(height: 16),
          DropdownButton<Device>(
            value: currentGWS ?? gws.firstOrNull,
            items: gws
                .map<DropdownMenuItem<Device>>(
                    (device) => DropdownMenuItem<Device>(
                          value: device,
                          child: Text(device.name),
                        ))
                .toList(),
            onChanged: (Device? value) {
              if (value != null) {
                changeGW(value);
              }
            },
          ),
          SizedBox(height: 32),
          FoxIoTPrimaryButton(onClick: startConnecting)
        ],
      ),
    );
  }
}
