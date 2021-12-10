import 'dart:convert';

import '../models/photo.dart';
import 'package:http/http.dart' as http;

const _photoLimit = 10;

class PhotoRepository {
  Future<List<Photo>> fetchPhotos([int startIndex = 0]) async {
    final response = await http.get(
      Uri.https(
        'jsonplaceholder.typicode.com',
        '/photos',
        <String, String>{'_start': '$startIndex', '_limit': '$_photoLimit'},
      ),
    );
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;
      return body.map((dynamic json) {
        return Photo(
          id: json['id'] as int,
          title: json['title'] as String,
          url: json['url'] as String,
          thumbnailUrl: json['thumbnailUrl'] as String,
        );
      }).toList();
    }
    throw Exception('error fetching photos');
  }
}
