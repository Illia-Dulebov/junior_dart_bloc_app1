part of 'cart_bloc.dart';

enum ItemsStatus { initial, success, failure }

class CartState extends Equatable {
  const CartState(
      {this.items = const <CartItem>[], this.status = ItemsStatus.initial});

  final ItemsStatus status;
  final List<CartItem> items;

  CartState copyWith({
    List<CartItem>? items,
    ItemsStatus? status,
  }) {
    return CartState(
      items: items ?? this.items,
      status: status ?? this.status,
    );
  }

  @override
  String toString() {
    return '''CartState {status $status, items: ${items.length} }''';
  }

  @override
  List<Object> get props => [items];
}
