import 'package:equatable/equatable.dart';

class CartItem extends Equatable {
  const CartItem({required this.id, required this.title, required this.body});

  final int id;
  final String title;
  final String body;

  @override
  List<Object> get props => [id, title, body];
}
