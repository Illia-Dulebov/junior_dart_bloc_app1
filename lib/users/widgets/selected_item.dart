import 'package:bloc_app1/users/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectedItem extends StatelessWidget{
  final User user;
  const SelectedItem({Key? key, required this.user}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius:  BorderRadius.only(
          topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)
        ),
      ),
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                height: 200,
                decoration: BoxDecoration(color: user.isActive ? Colors.blue : Colors.grey),
                child: Center(
                  child: Text(user.username.split(' ').map((e) => e[0]).take(2).join(),
                  style: const TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),)
                ),
                                ),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(user.name, style: const TextStyle(fontSize: 25),),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Text('@${user.username}', style: const TextStyle(fontWeight: FontWeight.bold))
                ),
                Text(user.email),
              ],
            ),
          ),
          
          const Divider(height: 5,)
        ],
      ),
    );
  }
}