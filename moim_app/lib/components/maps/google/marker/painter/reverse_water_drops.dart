import 'dart:ui' as ui;
import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReverseWaterDrops extends CustomPainter {

  final String label;
  final ui.Image image;

  ReverseWaterDrops(this.label, this.image);

  @override
  void paint(Canvas canvas, Size size) {

    final center = Offset(50, 50);
    final radius = math.min(size.width, size.height) / 8;


    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    Path path0 = Path();

    canvas.drawPath(path0, paint0);

    Paint paint1 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    double xPath = size.width;
    double yPath = size.height;

    double moveWidth = -0.35;
    double moveHeight = 0.09;

    Path path1 = Path();
    path1.moveTo (xPath*(0.6688889+moveWidth),yPath*(0.2480000+moveHeight));
    path1.cubicTo(xPath*(0.6911111+moveWidth),yPath*(0.2480000+moveHeight),xPath*(0.7244444+moveWidth),yPath*(0.2760000+moveHeight),xPath*(0.7244444+moveWidth),yPath*(0.3480000+moveHeight));
    path1.cubicTo(xPath*(0.7244444+moveWidth),yPath*(0.3880000+moveHeight),xPath*(0.6944444+moveWidth),yPath*(0.4480000+moveHeight),xPath*(0.6688889+moveWidth),yPath*(0.4820000+moveHeight));
    path1.cubicTo(xPath*(0.6422222+moveWidth),yPath*(0.4460000+moveHeight),xPath*(0.6133333+moveWidth),yPath*(0.4180000+moveHeight),xPath*(0.6133333+moveWidth),yPath*(0.3480000+moveHeight));
    path1.cubicTo(xPath*(0.6133333+moveWidth),yPath*(0.3080000+moveHeight),xPath*(0.6300000+moveWidth),yPath*(0.2480000+moveHeight),xPath*(0.6688889+moveWidth),yPath*(0.2480000+moveHeight));
    path1.close();

    canvas.drawPath(path1, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}