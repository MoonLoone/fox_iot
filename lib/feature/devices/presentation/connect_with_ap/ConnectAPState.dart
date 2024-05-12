import 'package:flutter/cupertino.dart';

@immutable
class ConnectAPState {
  final String token;
  final String wifiName;
  final String wifiPassword;

  const ConnectAPState(
      {this.token = "", this.wifiName = "", this.wifiPassword = ""});

  ConnectAPState updateState(
          {String? token, String? wifiName, String? wifiPassword}) =>
      ConnectAPState(
          token: token ?? this.token,
          wifiName: wifiName ?? this.wifiName,
          wifiPassword: wifiPassword ?? this.wifiPassword);
}

class InitialState extends ConnectAPState {}
