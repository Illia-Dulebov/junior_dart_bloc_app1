import 'package:flutter/material.dart';
import 'package:bloc_app1/cart/cart.dart';

class CartListItem extends StatelessWidget {
  const CartListItem({Key? key, required this.item}) : super(key: key);

  final CartItem item;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      child: ListTile(
        leading: Text('${item.id}', style: textTheme.caption),
        title: Text(item.title),
        isThreeLine: true,
        subtitle: Text(item.body),
        dense: true,
      ),
    );
  }
}
