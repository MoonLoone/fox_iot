
import 'package:fox_iot/feature/devices/domain/models/BulbHSVColor.dart';

abstract class IBulbManagement{

  Future changeBulbColor(String bulbId, BulbHSVColor color);
  Future<bool> onOffBulb(String bulbId,bool newState);

}
