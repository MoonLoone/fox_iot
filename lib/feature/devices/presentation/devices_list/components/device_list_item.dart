import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fox_iot/feature/devices/domain/models/Device.dart';
import 'package:fox_iot/feature/devices/presentation/devices_ext.dart';
import 'package:fox_iot/feature/devices/presentation/devices_list/components/device_extension.dart';
import 'package:fox_iot/res/values/assets.dart';
import 'package:fox_iot/res/values/theme.dart';

class DeviceListItem extends StatelessWidget {
  final Device deviceItem;
  final String? description;

  const DeviceListItem(this.deviceItem, {this.description});

  @override
  Widget build(BuildContext context) {
    FoxIoTAsset image =
        FoxIotTheme.assets[getDeviceAssetName(deviceItem.deviceType)] ??
            UndefinedAsset();
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
                          deviceItem.name,
                          style: FoxIotTheme.textStyles.primary,
                        ),
                        if (description != null) Text(
                            description!,
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
