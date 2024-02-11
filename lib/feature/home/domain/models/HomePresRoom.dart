import 'dart:ffi';

import 'package:flutter/cupertino.dart';

@immutable
class HomePresRoom {
  final String name;
  final String id;

  /*
  locationID В пространстве 4x4 айди нужного квадрата
   */
  final int locationID;

  const HomePresRoom(this.name, this.id, this.locationID);
}
