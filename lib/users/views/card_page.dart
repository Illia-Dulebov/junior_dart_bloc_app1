import 'dart:math';


import 'package:bloc_app1/users/views/transparen_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'category.dart';
import 'credit_cards.dart';

class CardPage extends StatelessWidget{
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsetsDirectional.only(top: 50),
        color: Colors.black,
        alignment: Alignment.topCenter,
        child: CustomPaint(
          painter: BackgroundPainter(),
          child: Row(children: [
            Expanded(child: 
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[
                          TransparentIconButton(
                            iconData: Icons.menu, 
                            size: 30, secondaryColor: 
                            Colors.grey.withOpacity(0.5), 
                            onPressed: (){
                              print('Pressed transparent menu button');
                            }),
                            
                        ],),
                        
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const WhiteTextHeader(text: 'David Welcome Back!'),
                              TransparentIconButton(
                                iconData: Icons.add,
                                size: 25, secondaryColor: 
                                Colors.grey.withOpacity(0.5), 
                                onPressed: (){
                                  print('Pressed transparent + button');
                                }),
                            ],
                          ),
                        ),
                        

                        const WalletWidget(),

                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(children: [
                                Container(
                                  child: Text('Total Spent', style: TextStyle(color: Colors.white.withOpacity(0.5))),
                                  margin: const EdgeInsetsDirectional.only(bottom: 5),
                                  ),
                                const WhiteTextHeader(text: '\$1,520.00')
                              ],
                              crossAxisAlignment: CrossAxisAlignment.start,),
                              TransparentIconButton(
                                iconData: Icons.more_horiz_outlined, 
                                size: 30, 
                                secondaryColor: Colors.grey.withOpacity(0.5),
                                onPressed: (){
                                  print('Pressed transparent ... button');
                                },
                                )
                            ],
                          ),
                        ),
                        

                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  height: 120,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            CategoryWidget(color1: Color(0xFF1C1C1C), color2: Color(0xFF131114), icon: Icons.directions_car_outlined, 
                            onPressed: (){
                              print('Pressed category button');
                            },),
                            CategoryWidget(color1: Color(0xFF111514), color2: Color(0xFF131114), icon: Icons.directions_car_outlined, 
                            onPressed: (){
                              print('Pressed category button');
                            },),
                            CategoryWidget(color1: Color(0xFF111514), color2: Color(0xFF131114), icon: Icons.directions_car_outlined, 
                            onPressed: (){
                              print('Pressed category button');
                            },),
                            CategoryWidget(color1: Color(0xFF111514), color2: Color(0xFF131114), icon: Icons.directions_car_outlined, 
                            onPressed: (){
                              print('Pressed category button');
                            },),
                          ],
                        ),
                      )],
                  ),
                )
              ],
              
            ),
            )
          ],),
          ),
    ));
  }

}




class BackgroundPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    Paint paint = Paint()
    ..shader = ui.Gradient.linear(Offset(0, height / 2), Offset(width , height / 2), [const Color(0xFF272127), Colors.black, Colors.black], [0, 0.5, 1]);

    canvas.drawRect(Rect.largest, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }



}


class WhiteTextHeader extends StatelessWidget{
  final String text;
  const WhiteTextHeader({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 22),);
  }

}