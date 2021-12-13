import 'package:bloc_app1/cart/view/shape_painter.dart';
import 'package:flutter/material.dart';

class CardHolder extends StatelessWidget {
  late final int count;
  final VoidCallback onCountChanged;
  late final AnimationController animationController;

  CardHolder({
    required this.count,
    required this.onCountChanged,
    required this.animationController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomPaint(
          painter:
              ShapePainter(cardNum: count, animation: animationController.view),
          child: Container(
            width: 400.0,
            height: 320.0,
            child: GestureDetector(onTap: () => onCountChanged()),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Balance',
                  style: TextStyle(
                      color: Color.fromRGBO(131, 136, 140, 1), fontSize: 15),
                ),
                Padding(padding: EdgeInsets.all(3)),
                Text(
                  '100000 \$',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                Padding(padding: EdgeInsets.all(3)),
                Text(
                  'Upcoming payments',
                  style: TextStyle(
                      color: Color.fromRGBO(121, 136, 140, 1), fontSize: 20),
                )
              ],
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromRGBO(29, 134, 75, 0.8)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.arrow_downward),
                  Text(
                    '5.6 %',
                  ),
                ],
              ),
              onPressed: () {},
            ),
          ],
        )
      ],
    );
  }
}
