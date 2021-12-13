import 'package:flutter/material.dart';

// List(string, int, color)
// ignore: must_be_immutable
class CircleRectPattern extends StatefulWidget {
  late List arguments;

  CircleRectPattern(this.arguments);

  @override
  _CircleRectPatternState createState() => _CircleRectPatternState();
}

class _CircleRectPatternState extends State<CircleRectPattern> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {},
        child: Container(
            width: 300,
            height: 55,
            decoration: BoxDecoration(
              color: Color.fromRGBO(29, 89, 31, 0.5),
              border: Border.all(
                color: Colors.grey.shade800,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.arguments[0],
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text(
                  widget.arguments[1].toString(),
                  style: TextStyle(fontSize: 25, color: Colors.white),
                )
              ],
            )));
  }
}
