
import '../domain/models/DeviceType.dart';

DeviceType getTypeFromCategoryName(String? category){
  switch(category){
    case("wg2"): return DeviceType.hub;
    case("dj"): return DeviceType.bulb;
    case("wsdcg"): return DeviceType.thermal;
    case("pir"): return DeviceType.motion;
  }
  return DeviceType.unknown;
}
