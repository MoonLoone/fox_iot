import 'package:flutter/cupertino.dart';

import '../../../../utils/models/LoadingState.dart';
import '../../domain/FoxIoTHome.dart';
import '../../domain/FoxIoTRoom.dart';

@immutable
class HomeState {
  final bool isEditHome;
  final bool isSelectHome;
  final int? isAddRoomDialog;
  final LoadingState loadingState;
  final List<FoxIoTHome> homes;
  final List<FoxIoTRoom> rooms;
  final FoxIoTHome? currentHome;

  const HomeState(
      {this.isEditHome = false,
      this.isSelectHome = false,
      this.isAddRoomDialog,
      this.loadingState = const NotLoading(),
      this.rooms = const [],
      this.homes = const [],
      this.currentHome});

  HomeState updateState(
          {bool? isEditHome,
          bool? isSelectHome,
          int? isAddRoomDialog,
          LoadingState? loadingState,
          List<FoxIoTHome>? homes,
          List<FoxIoTRoom>? rooms,
          FoxIoTHome? currentHome}) =>
      HomeState(
          rooms: rooms ?? this.rooms,
          isAddRoomDialog: isAddRoomDialog,
          isEditHome: isEditHome ?? this.isEditHome,
          loadingState: loadingState ?? this.loadingState,
          homes: homes ?? this.homes,
          currentHome: currentHome ?? this.currentHome,
          isSelectHome: isSelectHome ?? this.isSelectHome);
}
