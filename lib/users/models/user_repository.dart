import 'dart:convert';
import 'user.dart';
import 'package:http/http.dart' as http;

class UserRepository {

  Future<List<User>> loadUsers({int limit = 10}) async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users?_limit=$limit'));
    if (response.statusCode == 200) {
      List<dynamic> list = jsonDecode(response.body);
      return List<User>.from(list.map((e) => User.fromJson(e)));
    } else {
      throw Exception('Failed to load users');
    }
  }


  Future<User> loadSingleUser({required int id}) async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users/$id'));
    if (response.statusCode == 200) {
      Map<String, dynamic> newUser = jsonDecode(response.body);
      return User.fromJson(newUser);
    } else {
      throw Exception('Failed to load user id = $id');
    }
  }
  
}

