import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatefulWidget{
  final Color color1;
  final Color color2;
  final IconData icon;
  final String text;
  final String spent;
  final GestureTapCallback onPressed;


  const CategoryWidget({Key? key, required this.color1, required this.color2, required this.icon, required this.onPressed, this.text = 'Category', this.spent = '\$100.00'}) : super(key: key);

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTapDown: (tap){
        setState(() {
          _isPressed = true;
        });
      },
      onTapCancel: (){
        setState(() {
          _isPressed = false;
        });
      },
      onTap: (){
        setState(() {
          _isPressed = false;
        });
        widget.onPressed();
      },
        child: CustomPaint(
          painter: CategoryPainter(!_isPressed ? widget.color1 : widget.color2, !_isPressed ? widget.color2 : widget.color1),
          child: Container(
            width: 250, 
            height: 120, 
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0, left: 10),
                  child: Icon(widget.icon, size: 50, color: Colors.white,),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(widget.text, style: const TextStyle(fontSize: 18, color: Colors.white),),
                    ),
                    Text(widget.spent, style: TextStyle(
                      color: Colors.white.withOpacity(0.4), 
                      fontWeight: FontWeight.w800,
                      fontSize: 20
                      ),),
                  ],
                )
              ],
            )
            ),
        ),
      ),
    );
  }
}

class CategoryPainter extends CustomPainter{
  final Color color1;
  final Color color2;

  CategoryPainter(this.color1, this.color2);
  
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    final center = Offset(width/2, height/2);
    final radius = min(height, width);

    Paint paint = Paint()
    ..shader = ui.Gradient.radial(center, radius, [color1, color2]);
    

    canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, width, height), const Radius.circular(15)), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}