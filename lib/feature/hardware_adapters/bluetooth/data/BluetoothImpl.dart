import 'package:flutter_blue/flutter_blue.dart';
import 'package:fox_iot/feature/hardware_adapters/bluetooth/domain/IBluetooth.dart';
import 'package:fox_iot/feature/hardware_adapters/bluetooth/domain/models/bluetooth_device.dart';

class BluetoothImpl extends IBluetooth {
  late final FlutterBlue _flutterBlue = FlutterBlue.instance;

  @override
  Future<List<BlueDevice>> getAllBluetoothDevices() async {
    List<BlueDevice> blueDevices = List.empty(growable: true);
    _flutterBlue.scanResults.listen((List<ScanResult> results) {
      blueDevices.addAll(convertResultsToBlueDevices(results));
    });
    return _flutterBlue
        .startScan(timeout: const Duration(seconds: 4))
        .then((value) => blueDevices);
  }

  @override
  Future<bool> connectToDevice(BlueDevice bluetoothDevice) async {
    await bluetoothDevice.bluetoothDevice.connect();
    return _flutterBlue.connectedDevices
        .then((value) => value.contains(bluetoothDevice.bluetoothDevice));
  }

  @override
  Future<bool> disconnectFromDevice(BlueDevice bluetoothDevice) async {
    await bluetoothDevice.bluetoothDevice.disconnect();
    return _flutterBlue.connectedDevices
        .then((value) => !value.contains(bluetoothDevice.bluetoothDevice));
  }

  @override
  Future<bool> sendDataToDevice(BlueDevice bluetoothDevice, String data) async {
    List<BluetoothService> services =
        await bluetoothDevice.bluetoothDevice.discoverServices();
    if (services.isEmpty || services.first.characteristics.isEmpty) {
      return false;
    }
    for (BluetoothCharacteristic c in services.first.characteristics) {
      await c.write([0x12, 0x34]);
    }
    return true;
  }

  List<BlueDevice> convertResultsToBlueDevices(List<ScanResult> results) {
    return results
        .map((ScanResult result) =>
            BlueDevice(result.device, name: result.device.name))
        .toList();
  }
}
