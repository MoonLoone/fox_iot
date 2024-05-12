import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:fox_iot/feature/home/pres/home_page/HomeActions.dart';
import 'package:fox_iot/feature/home/pres/home_page/HomeBloc.dart';
import 'package:fox_iot/feature/home/pres/home_page/HomeState.dart';
import 'package:fox_iot/feature/home/pres/models/RoomSquareType.dart';

import '../../../domain/FoxIoTRoom.dart';

class HomeView extends StatelessWidget {
  final HomePageBloc bloc;
  final HomeState state;

  HomeView(this.bloc, this.state);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: _getRoomsView(
            onRoomClick: (index) => bloc.add(OnRoomClick(index)),
            addRoom: (index) => bloc.add(OnCreateRoomClick(index)),
            rooms: state.rooms,
            isEditingModeEnabled: state.isEditHome));
  }

  Widget _getRoomsView(
      {required Function(int) onRoomClick,
      required Function(int) addRoom,
      required List<FoxIoTRoom> rooms,
      required bool isEditingModeEnabled}) {
    int viewArraySize = _findNearestPowerTwo(rooms.length);
    List<RoomSquareType> roomViewsList = List.generate(viewArraySize, (index) {
      if (isEditingModeEnabled) {
        return AddRoomSquare(() => addRoom(index));
      }
      return EmptyRoomSquare();
    });
    for (var element in rooms) {
      roomViewsList[element.id] =
          RoomSquare(element.name, () => onRoomClick(element.id));
    }
    return LayoutGrid(
        columnSizes: List.filled(_log2(roomViewsList.length), 100.px),
        rowSizes: List.filled(_log2(roomViewsList.length), 100.px),
        children: roomViewsList);
  }

  int _findNearestPowerTwo(int roomCount) {
    if (roomCount == 0) return 1;
    if (roomCount < 9) return 9;
    return 16;
  }

  int _log2(num x) {
    return log(x) ~/ log(2);
  }
}
