import 'package:bloc_app1/users/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_app1/users/bloc/user/user.dart';

import 'detail.dart';

class UserItem extends StatelessWidget{
  final User user;
  const UserItem({Key? key, required this.user}) : super(key: key);

  
  
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
                child: Stack(
                  children: 
                  [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => UserDetail(user: user,)));
                        },
                      child: Hero(
                        tag: '${user.username}__tag',
                        child: Container(
                        height: 200,
                        decoration: BoxDecoration(color: user.isActive ? Colors.blue : Colors.grey),
                        child: Center(
                          child: Text(user.username.split(' ').map((e) => e[0]).take(2).join(),
                          style: const TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),)
                        ),
                                        ),
                      ),
                    ),
                  Positioned(
                    right: 0,
                    child: 
                      Row(children: [
                        user.isActive ?

                        IconButton(
                          onPressed: (){
                            BlocProvider.of<UserBloc>(context).add(UserBan(user.copyWith(isActive: false)));
                          }, 
                          icon:  const Icon(Icons.person_off_outlined, size: 20, color: Colors.white)) :
                       
                        IconButton(onPressed: (){
                          BlocProvider.of<UserBloc>(context).add(UserRenew(user.copyWith(isActive: true)));
                        }, icon: const Icon(Icons.keyboard_return_outlined, size: 20, color: Colors.white)),
                      
                        
                        
                        
                        IconButton(onPressed: () => {showDialog(context: context, builder: (context) {
                            return AlertDialog(
                            title: const Text('Delete user?'),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {Navigator.pop(context, 'Cancel');},
                                    child: const Text('Cancel'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      BlocProvider.of<UserBloc>(context).add(UserDelete(user.copyWith()));
                                      Navigator.pop(context, 'Accept');
                                    },
                                    child: const Text('Accept'),
                                  )
                                ],
                          );
                        }),
                        }
                          , icon: const Icon(Icons.delete_outline, size: 20, color: Colors.white,))
                      ],)
                  )]
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