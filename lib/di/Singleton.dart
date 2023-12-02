import 'package:fox_iot/feature/auth/data/AuthRepo.dart';
import 'package:fox_iot/feature/auth/domain/IAuthRepo.dart';
import 'package:fox_iot/feature/devices/data/DeviceRepo.dart';
import 'package:fox_iot/feature/devices/domain/IDeviceRepo.dart';
import 'package:get_it/get_it.dart';

void registerSingletons() async {
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<IAuthRepo>(AuthRepo());
  getIt.registerSingleton<IDeviceRepo>(DeviceRepo());
}
