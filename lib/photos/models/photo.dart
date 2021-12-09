import 'package:equatable/equatable.dart';

class Photo extends Equatable {
  const Photo(
      {required this.id,
      required this.title,
      required this.url,
      required this.thumbnailUrl});

  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  @override
  List<Object> get props => [id, title, url, thumbnailUrl];
}
