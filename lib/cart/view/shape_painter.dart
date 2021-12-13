import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShapePainter extends CustomPainter {
  ShapePainter({required this.cardNum, required this.animation})
      : super(repaint: animation);

  final int cardNum;
  late final Animation<Color> color;
  final Animation<double> animation;

  void setColorAnimation(Color start, Color end) {
    color = ColorTween(begin: start, end: end).animate(animation)
        as Animation<Color>;
  }

  void printCard(
    Canvas canvas,
    Size size,
    Color first,
    Color second,
    Color third,
  ) {
    var paint = Paint()
      ..color = first
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    final radius = Radius.circular(32);
    final rect = Rect.fromLTRB(30, 30, 350, 230);
    final rect1 = Rect.fromLTRB(30, 20, 350, 230);
    paintShadowBoxes(canvas, size, rect.center, -3, -3, -40, 10, 57, radius,
        rect1, 0.8, second);
    paintShadowBoxes(canvas, size, rect.center, -2.84, -7, -45, 10, 80, radius,
        rect1, 0.6, third);

    canvas.drawRRect(RRect.fromRectAndRadius(rect, radius), paint);
    print(cardNum);

    paintText(canvas, size, 320, 230, 21.0, '4444 1111 6666 8888');
    paintIcon(canvas, size, Icons.credit_card, 60, 60, 25);
    paintText(canvas, size, 178, 350, 12.0, 'Card Holder');
    paintText(canvas, size, 200, 390, 15.0, 'Illia Duliebov');
    paintText(canvas, size, 550, 390, 15.0, 'MasterCard');
    paintIcon(canvas, size, Icons.circle, 260, 150, 30);
  }

  void paintShadowBoxes(
      Canvas canvas,
      Size size,
      pivot,
      double angle,
      rotationDx,
      rotationDy,
      translationDx,
      translationDy,
      radius,
      rectangle,
      opacity,
      Color clr) {
    var paintShadowBoxes = Paint()
      ..color = clr
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    canvas.save();
    canvas.translate(pivot.dx + translationDx, pivot.dy + translationDy);
    canvas.rotate(angle);
    canvas.translate(-pivot.dx - rotationDx, -pivot.dy - rotationDy);
    canvas.drawRRect(
        RRect.fromRectAndRadius(rectangle, radius), paintShadowBoxes);
    canvas.restore();
  }

  void paintText(Canvas canvas, Size size, rectWidth, rectHeight,
      double fontSize, String textHolder) {
    final textStyle = TextStyle(
      color: Colors.white,
      fontSize: fontSize,
    );
    final textSpan = TextSpan(
      text: textHolder,
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final xCenter = (rectWidth - textPainter.width) / 2;
    final yCenter = (rectHeight - textPainter.height) / 2;
    final offset = Offset(xCenter, yCenter);
    textPainter.paint(canvas, offset);
  }

  void paintIcon(Canvas canvas, Size size, IconData iconToDraw, double x,
      double y, double iconSize) {
    var builder = ui.ParagraphBuilder(ui.ParagraphStyle(
      fontFamily: iconToDraw.fontFamily,
      fontSize: iconSize,
    ))
      ..addText(String.fromCharCode(iconToDraw.codePoint));
    var para = builder.build();
    para.layout(const ui.ParagraphConstraints(width: 100));
    canvas.drawParagraph(para, Offset(x, y));
  }

  @override
  void paint(Canvas canvas, Size size) {
    //Color.fromRGBO(135, 30, 20, 1)
    //Color.fromRGBO(35, 30, 120, 1)
    if (cardNum == 0) {
      printCard(canvas, size, Color.fromRGBO(29, 134, 75, 1),
          Color.fromRGBO(135, 30, 20, 0.8), Color.fromRGBO(35, 30, 120, 0.8));
    } else if (cardNum == 1) {
      printCard(canvas, size, Color.fromRGBO(135, 30, 20, 1),
          Color.fromRGBO(29, 134, 75, 0.8), Color.fromRGBO(35, 30, 120, 0.8));
    } else if (cardNum == 2) {
      printCard(canvas, size, Color.fromRGBO(35, 30, 120, 1),
          Color.fromRGBO(135, 30, 20, 0.5), Color.fromRGBO(29, 134, 75, 0.5));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
