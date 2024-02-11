
import 'package:flutter/material.dart';

import '../domain/models/HomePresRoom.dart';

class Painter extends CustomPainter {

  final Paint pant = Paint()
    ..strokeWidth = 5
    ..color = Colors.black
    ..style = PaintingStyle.stroke;
  final bool repaintFlag;
  final List<HomePresRoom> rooms;

  Painter(this.repaintFlag, this.rooms)

  @override
  void paint(Canvas canvas, Size size) {
    for (var room in rooms) {
      double left = room.locationID * _rectSize;
      double right = left+_rectSize;
      double top = left;
      double bottom = top;
      Rect rect = Rect.fromLTRB(left, top, right, bottom);
      canvas.drawRect(rect, pant);
    }
  }

  @override
  bool shouldRepaint(Painter oldDelegate) {
    return oldDelegate.repaintFlag != repaintFlag;
  }

  static const double _rectSize = 100.0;

}
