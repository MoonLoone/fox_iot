import 'package:flutter/cupertino.dart';

@immutable
class AccountUserInfo {
  final String fullName;
  final int devicesCount;
  final int familyMembers;

  const AccountUserInfo(
      {required this.fullName,
      required this.devicesCount,
      required this.familyMembers});
}

class UndefinedUserInfo extends AccountUserInfo {
  const UndefinedUserInfo()
      : super(devicesCount: 0, familyMembers: 0, fullName: "Undefined user");
}
