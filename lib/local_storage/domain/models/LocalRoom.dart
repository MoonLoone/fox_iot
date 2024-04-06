import 'package:hive/hive.dart';

import '../../data/hive/BoxesStorage.dart';

part 'LocalRoom.g.dart';

@HiveType(typeId: BoxesStorage.roomAdapterId)
class LocalRoom {
  @HiveField(0)
  final String name;

  LocalRoom({required this.name});
}
