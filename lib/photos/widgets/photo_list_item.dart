import 'package:flutter/material.dart';
import '../photos.dart';

class PhotoListItem extends StatelessWidget {
  const PhotoListItem({Key? key, required this.photo}) : super(key: key);

  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(photo.thumbnailUrl),
              ),
              title: Text(photo.title),
            ),
            Image(
              image: NetworkImage(photo.url),
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
