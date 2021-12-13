import 'dart:ui';

import 'package:bloc_app1/cart/widgets/botom_nav_bar.dart';
import 'package:bloc_app1/cart/widgets/card_holder.dart';
import 'package:bloc_app1/cart/widgets/rect_choose.dart';
import 'package:bloc_app1/cart/widgets/rect_info.dart';
import 'package:flutter/material.dart';

class MyPainter extends StatefulWidget {
  @override
  _MyPainterState createState() => _MyPainterState();
}

class _MyPainterState extends State<MyPainter>
    with SingleTickerProviderStateMixin {
  int page = 0;
  late AnimationController _animationController;

  int selectedIndex = 0;

  GlobalKey globalKey = new GlobalKey(debugLabel: 'btm_app_bar');

  _MyPainterState() {
    Future.delayed(Duration(seconds: 2))
        .then((_) => _animationController.forward());
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(29, 39, 31, 0.5),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.fromLTRB(15, 20, 15, 15)),
                Text(
                  'Hi Illia',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Padding(padding: EdgeInsets.all(3)),
                Text(
                  'Welcome Back',
                  style: TextStyle(
                      color: Color.fromRGBO(131, 136, 140, 1), fontSize: 15),
                )
              ],
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://www.woolha.com/media/2020/03/flutter-circleavatar-minradius-maxradius.jpg'),
                )),
          ],
        ),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        CardHolder(
            count: page,
            animationController: _animationController,
            onCountChanged: () => setState(() {
                  page += 1;
                  if (page >= 3) {
                    page = 0;
                  }
                })),
        RectChoose(count: selectedIndex),
      ]),
      bottomNavigationBar: BottomNavBar(
        currentIndex: selectedIndex,
        onCountChanged: (int val) => setState(() => selectedIndex = val),
      ),
    );
  }
}
