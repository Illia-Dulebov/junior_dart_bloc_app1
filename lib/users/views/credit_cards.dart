
import 'dart:math';
import 'dart:ui' as ui;

import 'package:bloc_app1/users/models/card.dart' as card;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class WalletWidget extends StatefulWidget{
  const WalletWidget({Key? key}) : super(key: key);


//   Future<ui.Image> loadUiImage(String imageAssetPath) async {
//     final ByteData data = await rootBundle.load(imageAssetPath);
//     final Completer<ui.Image> completer = Completer();
//     ui.decodeImageFromList(Uint8List.view(data.buffer), (ui.Image img) {
//       return completer.complete(img);
//     });
//     return completer.future;
// }

  @override
  State<WalletWidget> createState() => _WalletWidgetState();
}

class _WalletWidgetState extends State<WalletWidget> with TickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double> curve;

    @override
    void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(seconds: 1), vsync: this);
    curve = CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  List<card.Card> cardList = [
    card.Card(number: '0000 0000 0000 0000', owner: 'David Louis', paySystem: card.PaySystem.visa),
    card.Card(number: '1111 1111 1111 1111', owner: 'Daniel Louis', paySystem: card.PaySystem.visa),
    card.Card(number: '2222 2222 2222 2222', owner: 'John Louis', paySystem: card.PaySystem.visa),
  ];


    @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onLongPress: (){
        Clipboard.setData(ClipboardData(text: cardList[0].number));
        var snackBar = const SnackBar(content: Text('Card number copied to clipboard'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      onDoubleTap: () async{
        controller.forward();
        await Future.delayed(const Duration(milliseconds: 700));
        setState(() {
          var length = cardList.length;
          card.Card temp = cardList.removeAt(0);
          cardList.insert(length - 1 , temp);
        });
        controller.reverse();
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: AnimatedWallet(cardList: cardList, firstCardColor: const Color(0xFFE5BCE7), animation: curve)
      ),
    );
  }
}


class AnimatedWallet extends AnimatedWidget{
  final List<card.Card> cardList;
  final Color firstCardColor;
  final Tween<double> _tween;

  AnimatedWallet({Key? key, required this.cardList,required this.firstCardColor, required Animation<double> animation}) 
  : _tween = Tween<double>(begin: 23, end: 0), super(key: key, listenable: animation);

  
  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return CustomPaint(
          painter: WalletPainter(cardList, firstCardColor, _tween.evaluate(animation)),
          child: Container(height: MediaQuery.of(context).size.height * 0.4,),
    );
  }

}


class WalletPainter extends CustomPainter{
  final List<card.Card> cardList;
  final Color firstCardColor;
  final double animatedAngle;

  void rotate(Canvas canvas, double cx, double cy, double angle) {
    canvas.translate(cx, cy);
    canvas.rotate(angle);
    canvas.translate(-cx, -cy);
}
  
  WalletPainter(this.cardList, this.firstCardColor, this.animatedAngle);
  
  @override
  void paint(Canvas canvas, Size size) async{
    final height = size.height;
    final width = size.width;

    for(int i = cardList.length - 1; i >= 0; i--){

    canvas.save();
    canvas.rotate(pi/2);
    canvas.translate(i * 30, -40 - height - i * 15);
    rotate(canvas, height, height * 0.6, -i * animatedAngle * pi/180);
    
    

    TextStyle cardNumberStyle = const TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w500
    );

    Color textColor = i == 0 ? Colors.black : Colors.white.withOpacity(0.6);

    TextStyle nameLabelStyle = TextStyle(
      color: textColor,
      fontSize: 10,
    );



    TextStyle nameStyle = TextStyle(
      color: textColor,
      fontSize: 16,
      fontWeight: FontWeight.w800
    );

    TextSpan cardNumberSpan = TextSpan(
      text: i == 0 ? cardList[i].number : '',
      style: cardNumberStyle,
    );

    TextSpan nameLabelSpan = TextSpan(
      text: 'Card holder'.toUpperCase(),
      style: nameLabelStyle,
    );

    TextSpan nameSpan = TextSpan(
      text: cardList[i].owner,
      style: nameStyle,
    );

    TextPainter cardNumberPainter = TextPainter(
      text: cardNumberSpan,
      textDirection: TextDirection.ltr,
    );

    TextPainter nameLabelPainter = TextPainter(
      text: nameLabelSpan,
      textDirection: TextDirection.ltr,
    );

    TextPainter namePainter = TextPainter(
      text: nameSpan,
      textDirection: TextDirection.ltr,
    );


    cardNumberPainter.layout();
    nameLabelPainter.layout();
    namePainter.layout();

    Paint paint = Paint();

    if(i == 0){
      paint.color =  firstCardColor;
    }
    else{
      paint.shader = ui.Gradient.linear(Offset(0, height * (1 - i * 0.1)), Offset(height * (1 - i * 0.1), width * (0.6 - i * 0.05)), [const Color(0xFF615F62), const Color(0xFF181619)]);
    }

    

    RRect rect = RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, height * (1 - i * 0.1), height * (0.6 - i * 0.05)), const Radius.circular(20));
    canvas.drawShadow(Path()..addRRect(rect), const Color(0xff000000), 15, true);
    canvas.drawRRect(rect, paint);
    final offsetNumber = Offset(20, height * 0.2);
    final offsetLabel = Offset(20, height * (0.6 - i * 0.05) - 70);
    final offsetName = Offset(20, height * (0.6 - i * 0.05) - 50);
    cardNumberPainter.paint(canvas, offsetNumber);
    nameLabelPainter.paint(canvas, offsetLabel);
    namePainter.paint(canvas, offsetName);

    

    canvas.restore();
    
    }

    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
