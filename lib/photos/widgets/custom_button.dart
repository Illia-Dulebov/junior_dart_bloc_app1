import 'package:flutter/material.dart';

class MyCustomButton extends StatefulWidget {
  final IconData icon;
  final Color color1ForGradient;
  final Color color2ForGradient;
  final double coordinateTranslate;
  final double elevation;
  final Color color1ForGradientOnTap;
  final Color color2ForGradientOnTap;
  final double coordinateTranslateOnTap;
  final double elevationOnTap;


  const MyCustomButton({
    Key? key,
    required this.icon,
    this.color1ForGradient= const Color.fromARGB(255, 104, 0, 170),
    this.color2ForGradient = const Color.fromARGB(255, 244, 48, 143),
    this.coordinateTranslate = 0.6,
    this.elevation = 4.0,
    this.color1ForGradientOnTap= const Color.fromARGB(255, 85, 0, 140),
    this.color2ForGradientOnTap = const Color.fromARGB(255, 190, 38, 109),
    this.coordinateTranslateOnTap = 0.0,
    this.elevationOnTap = 2.0,
  }) : super(key: key);

  @override
  State<MyCustomButton> createState() => _MyCustomButtonState();
}

class _MyCustomButtonState extends State<MyCustomButton> {
  late Color color1ForGradient;
  late Color color2ForGradient;
  late double coordinateTranslate;
  late double elevation;

  @override
  void initState() {
    color1ForGradient = widget.color1ForGradient;
    color2ForGradient = widget.color2ForGradient;
    coordinateTranslate = widget.coordinateTranslate;
    elevation = widget.elevation;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      //onTap: ()=>{},
      onPointerDown: (_) {
        setState(() {
          color1ForGradient = widget.color1ForGradientOnTap;
          color2ForGradient = widget.color2ForGradientOnTap;
          coordinateTranslate = widget.coordinateTranslateOnTap;
          elevation = widget.elevationOnTap;
        });
      },
      onPointerUp: (_) {
        setState(() {
          color1ForGradient = widget.color1ForGradient;
          color2ForGradient = widget.color2ForGradient;
          coordinateTranslate = widget.coordinateTranslate;
          elevation = widget.elevation;
        });
      },
      child: CustomPaint(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Icon(
            widget.icon,
            color: Colors.white,
          ),
        ),
        painter: ButtonPainter(
            coordinateTranslate: coordinateTranslate,
            elevation: elevation,
            color1ForGradient: color1ForGradient,
            color2ForGradient: color2ForGradient),
      ),
    );
  }
}

class ButtonPainter extends CustomPainter {
  final double coordinateTranslate;
  final double elevation;
  final Color color1ForGradient;
  final Color color2ForGradient;

  ButtonPainter({
    required this.coordinateTranslate,
    required this.elevation,
    required this.color1ForGradient,
    required this.color2ForGradient,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint1 = Paint()
      ..shader = LinearGradient(
              colors: [color1ForGradient, color2ForGradient],
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter)
          .createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    Path path0 = Path();
    path0.moveTo(size.width * 0.5038500, size.height * 0.1267750);
    path0.cubicTo(
        size.width * 0.6501000,
        size.height * 0.1252750,
        size.width * 0.6249000,
        size.height * 0.2751750,
        size.width * 0.6748500,
        size.height * 0.3268250);
    path0.cubicTo(
        size.width * 0.7254000,
        size.height * 0.3773250,
        size.width * 0.8751250,
        size.height * 0.3485750,
        size.width * 0.8755000,
        size.height * 0.5010000);
    path0.cubicTo(
        size.width * 0.8751500,
        size.height * 0.6505500,
        size.width * 0.7240250,
        size.height * 0.6248750,
        size.width * 0.6742500,
        size.height * 0.6762750);
    path0.cubicTo(
        size.width * 0.6272250,
        size.height * 0.7252250,
        size.width * 0.6491000,
        size.height * 0.8751250,
        size.width * 0.5038500,
        size.height * 0.8742750);
    path0.cubicTo(
        size.width * 0.3510250,
        size.height * 0.8754000,
        size.width * 0.3739500,
        size.height * 0.7275750,
        size.width * 0.3265500,
        size.height * 0.6734250);
    path0.cubicTo(
        size.width * 0.2738000,
        size.height * 0.6253500,
        size.width * 0.1236750,
        size.height * 0.6515250,
        size.width * 0.1257000,
        size.height * 0.5017750);
    path0.cubicTo(
        size.width * 0.1230500,
        size.height * 0.3524500,
        size.width * 0.2726750,
        size.height * 0.3739000,
        size.width * 0.3272000,
        size.height * 0.3255250);
    path0.cubicTo(
        size.width * 0.3737000,
        size.height * 0.2730000,
        size.width * 0.3507750,
        size.height * 0.1245000,
        size.width * 0.5038500,
        size.height * 0.1267750);
    path0.close();

    canvas.save();
    canvas.translate(coordinateTranslate, coordinateTranslate);
    canvas.drawShadow(
        path0, const Color.fromARGB(255, 244, 48, 143), elevation, false);
    canvas.restore();
    canvas.drawPath(path0, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
