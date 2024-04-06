import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../res/values/assets.dart';
import '../../../../../res/values/theme.dart';
import '../../../domain/models/DeviceConnectingType.dart';
import '../../devices_ext.dart';

class DeviceConnectingTypeItem extends StatelessWidget {
  final DeviceConnectingType connectingType;

  const DeviceConnectingTypeItem(this.connectingType);

  @override
  Widget build(BuildContext context) {
    FoxIoTAsset image =
        FoxIotTheme.assets[getConnectType(connectingType)] ?? UndefinedAsset();
    return Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border:
                    Border.all(width: 1, color: FoxIotTheme.colors.secondary),
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                color: Colors.white),
            child: Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Image.asset(
                      image.url,
                      width: 48,
                      height: 48,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      children: [
                        Text(
                          getConnectDeviceName(context, connectingType),
                          style: FoxIotTheme.textStyles.primary,
                        ),
                        Text(
                          getConnectDeviceDescription(context, connectingType),
                          style: FoxIotTheme.textStyles.secondary,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                  ],
                ))));
  }
}
