import 'package:flutter/material.dart';
import 'package:bloc_app1/cart/widgets/rect_info.dart';

class RectChoose extends StatefulWidget {
  late final int count;

  RectChoose({
    required this.count,
  });

  @override
  _RectChooseState createState() => _RectChooseState();
}

class _RectChooseState extends State<RectChoose> {
  @override
  Widget build(BuildContext context) {
    if (widget.count == 0) {
      return CircleRectPattern(['Your income:', 4500, Colors.red]);
    } else if (widget.count == 1) {
      return CircleRectPattern(['Some info:', 100, Colors.amber]);
    } else if (widget.count == 2) {
      return CircleRectPattern(['Some info:', 678, Colors.green]);
    } else {
      return CircleRectPattern(['Some info:', 450, Colors.blue]);
    }
  }
}
