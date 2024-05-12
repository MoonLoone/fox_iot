
import 'package:hive/hive.dart';

import '../../data/hive/BoxesStorage.dart';
part 'LocalHome.g.dart';
/** Изменения необходимо вносить также в UserAdapter **/
@HiveType(typeId: BoxesStorage.homeAdapterId)
class LocalHome {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;

  LocalHome({required this.id, required this.name});
}
