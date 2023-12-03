import 'models/bluetooth_device.dart';

abstract class IBluetooth {

  Future<List<BlueDevice>> getAllBluetoothDevices();

  Future<bool> connectToDevice(BlueDevice bluetoothDevice);

  Future<bool> disconnectFromDevice(BlueDevice bluetoothDevice);

  Future<bool> sendDataToDevice(BlueDevice bluetoothDevice, String data);

}
