import 'package:bloc_app1/users/cubit/selected/selected_cubit.dart';
import 'package:bloc_app1/users/models/models.dart';
import 'package:bloc_app1/users/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedPage extends StatelessWidget{
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Selected users')),
      body: BlocBuilder<SelectedCubit, List<User>>(
        builder: (context, state){
          return SizedBox(
              child: ListView(
                children: [
                ...state.map((user) => SelectedItem(user: user))
                ]
              ),
            );
        },
      ),
    );
  }

}