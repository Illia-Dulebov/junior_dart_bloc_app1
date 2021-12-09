import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import '../models/photo.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:stream_transform/stream_transform.dart';

part 'photo_event.dart';

part 'photo_state.dart';

const _photoLimit = 10;
const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  PhotoBloc({required this.httpClient}) : super(const PhotoState()) {
    on<PhotoFetched>(
      _onPhotoFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  final http.Client httpClient;

  _onPhotoFetched(
    PhotoFetched event,
    Emitter<PhotoState> emit,
  ) async {
    if (state.hasReachedMax) return;

    try {
      if (state.status == PhotoStatus.initial) {
        final photos = await _fetchPhotos();

        return emit(state.copyWith(
          status: PhotoStatus.success,
          photos: photos,
          hasReachedMax: false,
        ));
      }

      final photos = await _fetchPhotos(state.photos.length);

      if (photos.isEmpty) {
        return emit(state.copyWith(hasReachedMax: true));
      }

      return emit(
        state.copyWith(
          status: PhotoStatus.success,
          photos: List.of(state.photos)..addAll(photos),
          hasReachedMax: false,
        ),
      );
    } catch (_) {
      return emit(state.copyWith(status: PhotoStatus.failure));
    }
  }

  Future<List<Photo>> _fetchPhotos([int startIndex = 0]) async {
    final response = await httpClient.get(
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
