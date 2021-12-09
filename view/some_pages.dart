import 'package:bloc_app1/cart/view/cart_page.dart';
import 'package:bloc_app1/cart/view/user_page.dart';
import 'package:flutter/material.dart';

class SomePages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Illia`s Cubit')),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
              child: ElevatedButton(
                  child: Text('User Cubit'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UserPage()),
                    );
                  })),
          Center(
              child: ElevatedButton(
                  child: Text('Cart Bloc'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartPage()),
                    );
                  }))
        ]));
  }
}
