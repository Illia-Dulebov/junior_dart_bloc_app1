import 'package:bloc_app1/cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(builder: (context, state) {
      if (state is UserErrorState) {
        return Center(
          child: Text(
            'Error fetching users',
            style: TextStyle(fontSize: 20.0),
          ),
        );
      }
      if (state is UserLoadingState) {
        return BottomLoader();
      }
      if (state is UserLoadedState) {
        return ListView.builder(
          itemCount: state.loadedUser.length,
          itemBuilder: (context, index) => Container(
            child: ListTile(
              leading: Text(
                'ID: ${state.loadedUser[index].id}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              title: Column(
                children: <Widget>[
                  Text(
                    '${state.loadedUser[index].name}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Email: ${state.loadedUser[index].email}',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                      Text(
                        'Phone: ${state.loadedUser[index].phone}',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      } else {
        return Center(
            child: ElevatedButton(
                child: Text('Load'),
                onPressed: () {
                  context.read<UserCubit>().fetchUsers();
                }));
      }
    });
  }
}
