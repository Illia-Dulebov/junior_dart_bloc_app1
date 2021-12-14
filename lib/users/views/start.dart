import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'card_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> with TickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double> curve;

    @override
      void initState() {
      super.initState();
      
      controller = AnimationController(duration: const Duration(seconds: 1), vsync: this);
      curve = CurvedAnimation(parent: controller, curve: Curves.easeIn)..addStatusListener((status) {
                  if (status == AnimationStatus.completed) {
                    controller.reverse();
                  } else if (status == AnimationStatus.dismissed) {
                    controller.forward();
                  }
                });
      controller.forward();

    
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.black,
      padding: const EdgeInsetsDirectional.only(top: 100),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: const Text('Verification', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 22),),
              ),
              
              Text('Touch ID sensor to verify transactions', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18, color: Colors.grey[500]), textAlign: TextAlign.center,),
            ],
          ),
        ),
        TouchIDButtonWidget(
          color1: const Color(0xFFE5BCE7), 
          color2: const Color(0xFF574560),
          icon: Icons.fingerprint_outlined, 
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const CardPage()));
        },),
        Expanded(
          child: BottomArrowsWidget(
            color1: const Color(0xFFE5BCE7), 
            color2: const Color(0xFF07061B),
            animation: curve,
            )
        )
      ],),
      ),
    );
    }
}

class BottomArrowsWidget extends AnimatedWidget{
  final Color color1;
  final Color color2;
  final Tween<double> _tween;
  BottomArrowsWidget({Key? key, required this.color1, required this.color2, required Animation<double> animation}) : _tween = Tween<double>(begin: -10, end: 0), super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return CustomPaint(
      painter: BottomArrowsPainter(color1, color2, _tween.evaluate(animation)),
      child: Container(),
    );
  }
  
}

class BottomArrowsPainter extends CustomPainter{
  final Color color1;
  final Color color2;
  final double deltaTotalHeight;

  BottomArrowsPainter(this.color1, this.color2, this.deltaTotalHeight);
  
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    double deltaHeight = 25.0;

    for (int i = 0; i < 3; i++){
    Paint paint = Paint()
    ..shader = ui.Gradient.linear(Offset(width/2, 0), Offset(width/2, height), 
    [color1.withOpacity(0.3 + i * 0.2), color2.withOpacity(0.3 + i * 0.2)]);

    Path firstPath = Path()
      ..addPolygon([
        Offset(width * 0.3, deltaTotalHeight + height * 0.1 + i * deltaHeight),
        Offset(width * 0.3, height + i * deltaHeight),
        Offset(width * 0.7, height + i * deltaHeight),
        Offset(width * 0.7, deltaTotalHeight + height * 0.1 + i * deltaHeight),
        Offset(width / 2, deltaTotalHeight + i * deltaHeight),
        ], true);
      canvas.drawPath(firstPath, paint);
    } 
    
    

    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class TouchIDButtonWidget extends StatefulWidget{
  final GestureTapCallback onPressed;
  final Color color1;
  final Color color2;
  final IconData icon;

  const TouchIDButtonWidget({Key? key, required this.color1, required this.color2, required this.icon, required this.onPressed}) : super(key: key);

  @override
  State<TouchIDButtonWidget> createState() => _TouchIDButtonWidgetState();
}

class _TouchIDButtonWidgetState extends State<TouchIDButtonWidget> {
  bool _isPressed = false;
  bool _isLongPressed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
          margin: const EdgeInsets.symmetric(vertical: 20), 
          height: 300, 
          child: GestureDetector(
            onLongPressDown : (tap){
              setState(() {
                _isPressed = true;
              });
            },

            onLongPressEnd  : (tap){
              setState(() {
                _isPressed = false;
              });
            },


            onLongPressCancel : (){
              setState(() {
                _isPressed = false;
              });
            },



            onLongPress : () async {
              setState(() {
                _isLongPressed = true;
                _isPressed = false;
              });
              await Future.delayed(const Duration(seconds: 1));
              widget.onPressed();
              await Future.delayed(const Duration(seconds: 1));
              setState(() {
                _isLongPressed = false;
              });
            },
            child: CustomPaint(
              painter: TouchIDButtonPainter(color1: _isLongPressed ? Colors.green : !_isPressed ? widget.color1 : widget.color2, color2: _isLongPressed ? Colors.green[300] ??  Colors.green: !_isPressed ? widget.color2 : widget.color1),
              child: Center(child: Icon(widget.icon, color: !_isPressed ? Colors.black : Colors.white, size: 40,),),
            ),
          ),
    );
  }
}


class TouchIDButtonPainter extends CustomPainter{
  Color color1;
  Color color2;

  TouchIDButtonPainter({required this.color1, required this.color2});

  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    final center = Offset(width/2, height/2);
    var radius = 50.0;


    Paint mainCirclePaint = Paint()
      ..shader = ui.Gradient.radial(center, 70, [color1, color2]);

    canvas.drawCircle(center, radius, mainCirclePaint);

    for (int i = 1; i < 5; i++){
      Paint iterCirclePaint = Paint()
        ..color = color1.withOpacity(1 - 0.2 * i)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1;
      canvas.drawCircle(center, radius + 25 * i, iterCirclePaint);
    } 
    
   

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}