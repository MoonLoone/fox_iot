import 'package:fox_iot/local_storage/data/hive/BoxesStorage.dart';
import 'package:hive/hive.dart';

part 'MainUserInfo.g.dart';

@HiveType(typeId: BoxesStorage.mainInfoAdapterId)
class MainUserInfo extends HiveObject {
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final String? bio;
  @HiveField(2)
  final String? avatarUrl;

  MainUserInfo(
      {required this.name,
      required this.bio,
      required this.avatarUrl});

  @override
  String toString() {
    return 'MainUserInfo{name: $name, avatar: $avatarUrl, bio: $bio}';
  }
}
