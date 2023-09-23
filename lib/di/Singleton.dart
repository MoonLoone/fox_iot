import 'package:fox_iot/auth/data/AuthRepo.dart';
import 'package:fox_iot/auth/domain/IAuthRepo.dart';
import 'package:get_it/get_it.dart';

void registerSingletons() async {
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<IAuthRepo>(AuthRepo());
}
