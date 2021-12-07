import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_app1/cart/cart.dart';
import 'package:http/http.dart' as http;

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: BlocProvider(
        create: (_) => CartBloc(httpClient: http.Client())..add(CartFetched()),
        child: CartList(),
      ),
    );
  }
}
