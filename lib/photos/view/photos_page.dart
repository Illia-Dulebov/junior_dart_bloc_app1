import 'package:bloc_app1/photos/view/wallet_app.dart';
import 'package:flutter/material.dart';
import '../photos.dart';

class PhotosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photos'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WalletApp()));
              },
              icon: Icon(Icons.account_balance_wallet_outlined))
        ],
      ),
      body: PhotosList(),
    );
  }
}
