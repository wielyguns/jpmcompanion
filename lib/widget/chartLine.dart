import 'package:flutter/material.dart';
import 'package:jpmcompanion/const.dart';
import 'dart:math';

class ChartLine extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = purpleTheme
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    Path path = Path()..moveTo(0, -80);
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 20);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
