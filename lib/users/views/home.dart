import 'package:bloc_app1/users/bloc/user/user.dart';
import 'package:bloc_app1/users/views/start.dart';
import 'package:bloc_app1/users/views/views.dart';
import 'package:bloc_app1/users/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersHomePage extends StatelessWidget{
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  UsersHomePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Users Bloc App'),
        actions: [
          IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => SelectedPage()));}, icon: Icon(Icons.person_outlined, color: Colors.white,)),
          IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => StartPage()));}, icon: Icon(Icons.fingerprint_outlined, color: Colors.white,))
        ],
        ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state){
          if(state is UserLoadInProgress){
            BlocProvider.of<UserBloc>(context).add(UserLoaded());
            return const Center(child: CircularProgressIndicator());
          }
          else if (state is UserLoadSuccess){
            final users = state.users;
            return SizedBox(
              child: ListView(
                children: [
                ...users.map((user) => UserItem(user: user))
                ]
              ),
            );
          }
          else{
            return const Center(child: Text('Oops =(\n We\'ve failed to load data'));
          }

      }),
    );
  }

}