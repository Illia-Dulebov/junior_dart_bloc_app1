import 'package:equatable/equatable.dart';

class User extends Equatable{
  final int id;
  final String name;
  final String username;
  final String email;
  final bool isActive;

  const User({required this.id, required this.name, required this.username, required this.email, this.isActive = true});

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email']);
  }

  User copyWith({int? id, String? name, String? username, String? email, bool? isActive}) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      isActive: isActive ?? this.isActive,
    );
  }



  @override
  List<Object?> get props => [id, name, username, email, isActive];

}