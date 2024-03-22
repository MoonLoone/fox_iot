import 'package:fox_iot/local_storage/data/hive/BoxesStorage.dart';
import 'package:hive/hive.dart';

part 'MainUserInfo.g.dart';

@HiveType(typeId: BoxesStorage.mainInfoAdapterId)
class MainUserInfo extends HiveObject {
  @HiveField(0)
  final String firstName;
  @HiveField(1)
  final String? lastName;
  @HiveField(2)
  final String? bio;
  @HiveField(3)
  final String? avatarUrl;

  MainUserInfo(
      {required this.firstName,
      required this.lastName,
      required this.bio,
      required this.avatarUrl});

  @override
  String toString() {
    return 'MainUserInfo{firstName: $firstName, lastName: $lastName, avatar: $avatarUrl, bio: $bio}';
  }
}
