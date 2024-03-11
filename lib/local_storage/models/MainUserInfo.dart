
import 'package:fox_iot/local_storage/hive/BoxesStorage.dart';
import 'package:hive/hive.dart';
part 'MainUserInfo.g.dart';

@HiveType(typeId: BoxesStorage.mainInfoAdapterId)
class MainUserInfo extends HiveObject{

  @HiveField(0)
  final String firstName;
  @HiveField(1)
  final String? lastName;

  MainUserInfo({required this.firstName,required this.lastName});

  @override
  String toString() {
    return 'MainUserInfo{firstName: $firstName, lastName: $lastName}';
  }

}
