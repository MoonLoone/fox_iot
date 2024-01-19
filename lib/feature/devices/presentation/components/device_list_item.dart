import 'package:flutter/cupertino.dart';
import 'package:fox_iot/feature/devices/domain/models/Device.dart';
import 'package:fox_iot/feature/devices/presentation/components/device_extension.dart';
import 'package:fox_iot/res/values/assets.dart';
import 'package:fox_iot/res/values/theme.dart';

class DeviceListItem extends StatelessWidget {
  final Device deviceItem;

  const DeviceListItem(this.deviceItem, {super.key});

  @override
  Widget build(BuildContext context) {
    FoxIoTAsset image = FoxIotTheme.assets[deviceItem.getDeviceAssetName()] ??
        FoxIotTheme.assets.values.first;
    return FractionallySizedBox(
        widthFactor: 1,
        child: Row(children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(
                          width: 1, color: FoxIotTheme.colors.secondary),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(16))),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const SizedBox(
                        width: 16,
                      ),
                      Image.asset(
                        image.url,
                        width: image.size.width,
                        height: image.size.height,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        deviceItem.name,
                        style: FoxIotTheme.textStyles.primary,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                    ],
                  )))
        ]));
  }
}
