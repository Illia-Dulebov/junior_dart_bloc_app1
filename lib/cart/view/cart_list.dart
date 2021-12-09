import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_app1/cart/cart.dart';

class CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      return ListView.builder(
          itemCount: state.items.length,
          itemBuilder: (BuildContext context, int index) {
            return CartListItem(item: state.items[index]);
          });
    });
  }
}
