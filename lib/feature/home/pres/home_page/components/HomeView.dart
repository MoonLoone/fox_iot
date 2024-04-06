import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:fox_iot/res/values/theme.dart';

import '../../../domain/FoxIoTRoom.dart';

class HomeView extends StatelessWidget {
  final List<FoxIoTRoom> rooms;

  HomeView(this.rooms);

  @override
  Widget build(BuildContext context) {
    final roomsCount = 6; //rooms.length;
    final two = findNearestPowerTwo(roomsCount);
    final sizes = List.generate(two, (index) => FixedTrackSize(100));
    return Center(
        child: LayoutGrid(
            columnSizes: sizes,
            rowSizes: sizes,
            children: getRoomsView(roomsCount, two)));
  }

  int findNearestPowerTwo(int roomCount) {
    int i = 1;
    while (i * i < roomCount) {
      i++;
    }
    return i;
  }

  List<BoxView> getRoomsView(int roomsCount, int blocCount) {
    return List.generate(blocCount, (index) {
      if (index <= roomsCount) return RoomView(index.toString());
      else return AddRoomView();
    });
  }
}

abstract class BoxView extends StatelessWidget {}

class InvisibleBoxView extends BoxView {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class AddRoomView extends BoxView {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: FoxIotTheme.colors.secondary,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(), // This makes the button circular
          padding: EdgeInsets.all(
              20), // Adjust the padding to control the size of the button
        ),
        child: Icon(
          Icons.add, // The "+" icon
          size: 30, // Adjust the size of the icon
          color: Colors.white, // Icon color
        ),
        onPressed: () {
          // Handle button press
        },
      ),
    );
  }
}

class RoomView extends BoxView {
  final String name;

  RoomView(this.name);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: FoxIotTheme.colors.secondary,
      child: Text(name),
    );
  }
}
