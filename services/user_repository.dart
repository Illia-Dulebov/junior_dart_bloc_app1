import 'dart:convert';

import 'package:bloc_app1/cart/models/models.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  int _usersLimit = 10;

  Future<List<User>> fetchUsers([int startIndex = 0]) async {
    final response = await http.get(
      Uri.https(
        'jsonplaceholder.typicode.com',
        '/users',
        <String, String>{'_start': '$startIndex', '_limit': '$_usersLimit'},
      ),
    );
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;
      return body.map((dynamic json) {
        return User(
          id: json['id'] as int,
          name: json['name'] as String,
          email: json['email'] as String,
          phone: json['phone'] as String,
        );
      }).toList();
    }
    throw Exception('error fetching users');
  }
}
