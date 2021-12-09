import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_app1/cart/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:stream_transform/stream_transform.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

part 'cart_state.dart';
part 'cart_event.dart';

const _itemsLimit = 10;
const throttleDuration = Duration(milliseconds: 10);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class CartBloc extends Bloc<CartEvent, CartState> {
  final http.Client httpClient;

  CartBloc({required this.httpClient}) : super(const CartState()) {
    on<CartFetched>(
      _onCartFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }
  Future<void> _onCartFetched(
    CartFetched event,
    Emitter<CartState> emit,
  ) async {
    try {
      if (state.status == ItemsStatus.initial) {
        final cart = await _fetchPosts();
        return emit(state.copyWith(
          status: ItemsStatus.success,
          items: cart,
        ));
      }
    } catch (_) {
      emit(state.copyWith(status: ItemsStatus.failure));
    }
  }

  Future<List<CartItem>> _fetchPosts([int startIndex = 0]) async {
    final response = await httpClient.get(
      Uri.https(
        'jsonplaceholder.typicode.com',
        '/posts',
        <String, String>{'_start': '$startIndex', '_limit': '$_itemsLimit'},
      ),
    );
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;
      return body.map((dynamic json) {
        return CartItem(
          id: json['id'] as int,
          title: json['title'] as String,
          body: json['body'] as String,
        );
      }).toList();
    }
    throw Exception('error fetching posts');
  }
}
