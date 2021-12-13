import 'package:bloc_app1/cart/view/bnb_painer.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  late final int currentIndex;
  final Function(int) onCountChanged;

  BottomNavBar({
    required this.currentIndex,
    required this.onCountChanged,
  });

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with TickerProviderStateMixin {
  // ignore: non_constant_identifier_names
  late final Animation<Color> animation_color;

  // ignore: non_constant_identifier_names
  late final AnimationController controller_color;

  Map<int, bool> buttons = {
    0: false,
    1: false,
    2: false,
    3: false,
  };

  @override
  void initState() {
    super.initState();
    controller_color = AnimationController(
        duration: const Duration(milliseconds: 160), vsync: this);
    animation_color = Tween<Color>(
            begin: Color.fromRGBO(29, 39, 31, 0.5),
            end: Color.fromRGBO(29, 89, 31, 0.5))
        .animate(controller_color);
    controller_color.forward();
  }

  void handleOnPressedColor(int index) {
    setState(() {
      buttons[index] = true;
    });

    buttons.forEach((k, v) {
      if (index != k) {
        buttons[k] = false;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller_color.dispose();
  }

  Color? switchColor(int index) {
    if (buttons[index] == true) {
      return animation_color.value;
    } else {
      return Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        children: [
          Positioned(
            child: Container(
              width: size.width,
              height: 80,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  CustomPaint(
                    size: Size(size.width, 80),
                    painter: BNBCustomPainter(),
                  ),
                  Container(
                    width: size.width,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: switchColor(0),
                          child: IconButton(
                              icon: Icon(
                                Icons.home_filled,
                                color: widget.currentIndex == 0
                                    ? Colors.green.shade300
                                    : Colors.grey.shade400,
                              ),
                              onPressed: () {
                                handleOnPressedColor(0);
                                widget.onCountChanged(0);
                              }),
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: switchColor(1),
                          child: IconButton(
                            icon: Icon(
                              Icons.search,
                              color: widget.currentIndex == 1
                                  ? Colors.green.shade300
                                  : Colors.grey.shade400,
                            ),
                            onPressed: () {
                              handleOnPressedColor(1);
                              widget.onCountChanged(1);
                            },
                            splashColor: Colors.white,
                          ),
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: switchColor(2),
                          child: IconButton(
                              icon: Icon(
                                Icons.bookmark,
                                color: widget.currentIndex == 2
                                    ? Colors.green.shade300
                                    : Colors.grey.shade400,
                              ),
                              onPressed: () {
                                handleOnPressedColor(2);
                                widget.onCountChanged(2);
                              }),
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: switchColor(3),
                          child: IconButton(
                              icon: Icon(
                                Icons.notifications,
                                color: widget.currentIndex == 3
                                    ? Colors.green.shade300
                                    : Colors.grey.shade400,
                              ),
                              onPressed: () {
                                handleOnPressedColor(3);
                                widget.onCountChanged(3);
                              }),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
