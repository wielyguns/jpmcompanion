import 'package:flutter/material.dart';
import 'package:jpmcompanion/const.dart';
import 'dart:math';

class BarChartLine extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = purpleLightTheme;
    paint.strokeWidth = 2;

    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width, size.height / 2),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
