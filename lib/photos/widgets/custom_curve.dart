import 'dart:ui';

import 'package:flutter/cupertino.dart';

class CurveTop extends CustomPainter {
  final Color color1ForGradient;
  final Color color2ForGradient;

  CurveTop({
    required this.color1ForGradient,
    required this.color2ForGradient,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..shader = LinearGradient(
          colors: [color1ForGradient, color2ForGradient],
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter)
          .createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    Path path = Path();
    path.lineTo(size.width * 0.9, size.height * 0.81);
    path.cubicTo(size.width * 0.79, size.height * 0.74, size.width * 0.75,
        size.height * 0.76, size.width * 0.37, size.height * 0.75);
    path.cubicTo(
        0, size.height * 0.75, 0, size.height * 0.48, 0, size.height * 0.48);
    path.cubicTo(0, size.height * 0.48, 0, 0, 0, 0);
    path.cubicTo(0, 0, size.width, 0, size.width, 0);
    path.cubicTo(size.width, 0, size.width, size.height * 0.48, size.width,
        size.height * 0.48);
    path.cubicTo(size.width, size.height * 0.48, size.width, size.height,
        size.width, size.height);
    path.cubicTo(size.width, size.height, size.width, size.height * 0.89,
        size.width * 0.9, size.height * 0.81);
    path.cubicTo(size.width * 0.9, size.height * 0.81, size.width * 0.9,
        size.height * 0.81, size.width * 0.9, size.height * 0.81);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
