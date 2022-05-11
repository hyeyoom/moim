import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReverseWaterDrops extends CustomPainter {

  final ui.Image image;
  final Color outlineColor;

  ReverseWaterDrops(this.outlineColor, this.image);

  @override
  void paint(Canvas canvas, Size size) {

    double pointCenterX = size.width/2;
    double pointCenterY = size.height/2-size.width/8*5;

    Paint paint = Paint()
      ..color = outlineColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Paint invertedTriangle = Paint()
      ..color = outlineColor
      ..style = PaintingStyle.fill;

    Paint circleImage = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();

    path.addPolygon([
      Offset(size.width/1000*170, pointCenterY+(size.width/8*3)),
      Offset(size.width/1000*830, pointCenterY+(size.width/8*3)),
      Offset(pointCenterX, pointCenterY+size.width/8*5),
    ], true);

    canvas.drawCircle(Offset(pointCenterX, pointCenterY), size.width/2, paint);
    canvas.drawPath(path, invertedTriangle);

    var drawImageX = size.width/20;
    var drawImageY = pointCenterY-pointCenterX+size.width/20;
    Path path2 = Path()
      ..addOval(Rect.fromLTWH(drawImageX, drawImageY, size.width - size.width/10, size.width - size.width/10));
    canvas.drawCircle(Offset(pointCenterX, pointCenterY), size.width/100*45, circleImage);

    canvas.clipPath(path2);

    canvas.drawImage(image, Offset(drawImageX, drawImageY), circleImage);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}