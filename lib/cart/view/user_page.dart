import 'package:bloc_app1/cart/cart.dart';
import 'package:bloc_app1/cart/services/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class UserPage extends StatelessWidget {
  final usersRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Illia`s Cubit')),
        body: BlocProvider(
            create: (BuildContext context) => UserCubit(usersRepository),
            child: UserList()));
  }
}
