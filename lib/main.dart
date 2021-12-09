Skip to content
Search or jump to…
Pull requests
Issues
Marketplace
Explore
 
@Illia-Dulebov 
Illia-Dulebov
/
junior_dart_bloc_app1
Public
1
00
Code
Issues
Pull requests
1
Actions
Projects
Wiki
Security
Insights
Settings
junior_dart_bloc_app1/lib/main.dart
@tsymbaliuk7
tsymbaliuk7 added users app
Latest commit 2d8a6f8 23 hours ago
 History
 2 contributors
@Illia-Dulebov@tsymbaliuk7
105 lines (98 sloc)  2.79 KB
   
import 'package:bloc_app1/users/bloc/user/user.dart';
import 'package:bloc_app1/users/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

import 'cart/bloc_app.dart';
import 'users/users_app.dart';

part 'page_bloc.dart';
part 'page_state.dart';
part 'page_event.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<MyBloc>(
         create: (BuildContext context) => MyBloc(),
        ),
        BlocProvider<UserBloc>(
         create: (BuildContext context) => UserBloc(userRepository: UserRepository()),
        ),
        ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => MainPage(),
        '/Illia': (context) => BlocApp(),
        '/Dima': (context) => UsersApp(),
        //'/Anya': (context) => PageAnya(),
      },
      initialRoute: '/',
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocListener<MyBloc, PageState>(
        listener: (context, state) {
          if (state is Illia) {
            Navigator.of(context).pushNamed('/Illia');
          }
          if (state is Dima) {
            Navigator.of(context).pushNamed('/Dima');
          }
          if (state is Anya) {
            Navigator.of(context).pushNamed('/Anya');
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text('Flutter option App'),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.masks),
                label: 'Illia',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Dima',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'Anya',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: (index) {
              switch (index) {
                case 0:
                  context.read<MyBloc>().add(IlliaEvent());
                  break;
                case 1:
                  context.read<MyBloc>().add(DimaEvent());
                  break;
                case 2:
                  context.read<MyBloc>().add(AnyaEvent());
                  break;
                default:
                  context.read<MyBloc>().add(MainEvent());
              }
            },
          ),
        ));
  }
}
© 2021 GitHub, Inc.
Terms
Privacy
Security
Status
Docs
Contact GitHub
Pricing
API
Training
Blog
About
Loading complete
