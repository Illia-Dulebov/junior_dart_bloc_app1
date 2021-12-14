import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransparentIconButton extends StatefulWidget{
  final Color secondaryColor;
  final IconData iconData;
  final double size;
  final GestureTapCallback onPressed;

  const TransparentIconButton({Key? key, this.secondaryColor = Colors.grey, required this.iconData, required this.size, required this.onPressed}) : super(key: key);

  @override
  State<TransparentIconButton> createState() => _TransparentIconButtonState();
}

class _TransparentIconButtonState extends State<TransparentIconButton> {
  bool _isPressed = false; 

  @override
  Widget build(BuildContext context) {
    return GestureDetector( 
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
        painter: TransparentIconButtonPainter(!_isPressed ? Colors.transparent : widget.secondaryColor, widget.size),
        child:  Center(child: Icon(widget.iconData, size: widget.size, color: Colors.white,)),
      ),
    );
  }
}


class TransparentIconButtonPainter extends CustomPainter{
  final Color seconfaryColor;
  final double buttonSize;

  TransparentIconButtonPainter(this.seconfaryColor, this.buttonSize);

  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    final center = Offset(width/2, height/2);

    Path oval = Path()
        ..addOval(Rect.fromCircle(center: center, radius: buttonSize));
    Paint mainCirclePaint = Paint()
      ..color = seconfaryColor;

    canvas.drawShadow(oval, const Color(0xff000000), 30, true);
    canvas.drawCircle(center, buttonSize, mainCirclePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
