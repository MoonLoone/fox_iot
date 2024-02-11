import 'package:flutter/cupertino.dart';
import 'package:fox_iot/utils/models/LoadingState.dart';

import '../../domain/models/HomePresRoom.dart';

@immutable
class HomePageState {
  final LoadingState loadingState;
  final bool isChangeModeActive;
  final List<HomePresRoom> rooms;

  const HomePageState(
      {this.loadingState = const NotLoading(),
      this.isChangeModeActive = false,
      this.rooms = const <HomePresRoom>[]});

  HomePageState updateState(
      {LoadingState? loadingState,
      bool? isChangeModeActive,
      List<HomePresRoom>? rooms}) {
    return HomePageState(
        loadingState: loadingState ?? this.loadingState,
        isChangeModeActive: isChangeModeActive ?? this.isChangeModeActive,
        rooms: rooms ?? this.rooms);
  }
}
