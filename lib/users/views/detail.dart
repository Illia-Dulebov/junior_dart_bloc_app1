import 'package:bloc_app1/users/bloc/user/user.dart';
import 'package:bloc_app1/users/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDetail extends StatelessWidget{
  final User user;

  const UserDetail({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state){ 
        return Scaffold(
      appBar: AppBar(title: const Text('Update User')),
      body: ListView(
        children: [Column(children: [
          Row(children: [
            Expanded(child: 
            Hero(
              tag: '${user.username}__tag',
              child: Container(
                height: 300,
                decoration: BoxDecoration(color: user.isActive ? Colors.blue : Colors.grey),
                child: Center(
                child: Text(user.username.split(' ').map((e) => e[0]).take(2).join(),
                    style: const TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),)
                ),
              ),
            ))
          ],),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: UserForm(user: user))
        ],
        ),
        ])
    );
  });
  }
}

class UserForm extends StatefulWidget {
  final User user;
  
  const UserForm({Key? key, required this.user}) : super(key: key);

  @override
  UserFormState createState() {
    return UserFormState();
  }
}

class UserFormState extends State<UserForm> {
  String username = '';
  String email = '';
  String name = '';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            onSaved: (String? text){
              username = text ?? '';
            },
            initialValue: widget.user.username,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            onSaved: (String? text){
              name = text ?? '';
            },
            initialValue: widget.user.name,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            onSaved: (String? text){
              email = text ?? '';
            },
            initialValue: widget.user.email,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  BlocProvider.of<UserBloc>(context).add(UserUpdate(widget.user.copyWith(name: name, email: email, username: username)));
                  Navigator.pop(context);
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}