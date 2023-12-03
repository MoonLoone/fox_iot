import 'package:flutter_blue/flutter_blue.dart';
import 'package:fox_iot/feature/hardware_adapters/bluetooth/domain/IBluetooth.dart';
import 'package:fox_iot/feature/hardware_adapters/bluetooth/domain/models/bluetooth_device.dart';

class BluetoothImpl extends IBluetooth {
  final FlutterBlue _flutterBlue = FlutterBlue.instance;

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
  Future<bool> connectToDevice(BlueDevice bluetoothDevice) {
    // TODO: implement connectToDevice
    throw UnimplementedError();
  }

  @override
  Future<bool> disconnectFromDevice(BlueDevice bluetoothDevice) {
    // TODO: implement disconnectFromDevice
    throw UnimplementedError();
  }

  @override
  Future<bool> receiveDataFromDevice(BlueDevice bluetoothDevice) {
    // TODO: implement receiveDataFromDevice
    throw UnimplementedError();
  }

  @override
  Future<bool> sendDataToDevice(BlueDevice bluetoothDevice, String data) {
    // TODO: implement sendDataToDevice
    throw UnimplementedError();
  }

  List<BlueDevice> convertResultsToBlueDevices(List<ScanResult> results) {
    return results.map((ScanResult result) => BlueDevice()).toList();
  }
}
