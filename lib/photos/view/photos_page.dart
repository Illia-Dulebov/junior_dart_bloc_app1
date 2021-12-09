import 'package:flutter/material.dart';
import '../photos.dart';

class PhotosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Photos')),
      body: PhotosList(),
    );
  }
}
