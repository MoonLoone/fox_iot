import 'dart:ffi';

import 'package:hive/hive.dart';

import '../../data/hive/BoxesStorage.dart';
import 'LocalRoom.dart';
part 'LocalHome.g.dart';
/** Изменения необходимо вносить также в UserAdapter **/
@HiveType(typeId: BoxesStorage.homeAdapterId)
class LocalHome {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final List<LocalRoom> rooms;


  LocalHome({required this.id, required this.name, required this.rooms});
}
