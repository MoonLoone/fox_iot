import 'package:fox_iot/feature/auth/data/AuthRepo.dart';
import 'package:fox_iot/feature/auth/domain/IAuthRepo.dart';
import 'package:fox_iot/feature/devices/data/DeviceRepo.dart';
import 'package:fox_iot/feature/devices/domain/IDeviceRepo.dart';
import 'package:fox_iot/feature/hardware_adapters/bluetooth/data/BluetoothImpl.dart';
import 'package:fox_iot/feature/hardware_adapters/bluetooth/domain/IBluetooth.dart';
import 'package:fox_iot/local_storage/data/databases/FoxIoTUserDb.dart';
import 'package:fox_iot/local_storage/domain/IFoxIoTUserDb.dart';
import 'package:get_it/get_it.dart';

Future<void> registerSingletons() async {
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<IFoxIoTUserDb>(FoxIoTUserDb());
  getIt.registerSingleton<IBluetooth>(BluetoothImpl());
  getIt.registerSingleton<IAuthRepo>(AuthRepo());
  getIt.registerSingleton<IDeviceRepo>(DeviceRepo());
}
