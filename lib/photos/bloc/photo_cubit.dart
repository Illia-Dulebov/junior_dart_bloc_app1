import 'package:bloc/bloc.dart';
import 'package:bloc_app1/photos/bloc/photo_bloc.dart';
import 'package:bloc_app1/photos/repositories/photo_repository.dart';

class PhotoCubit extends Cubit<PhotoState> {
  final photoRepository = PhotoRepository();

  PhotoCubit() : super(PhotoState());

  Future<void> fetchPhotos() async {

    if (state.hasReachedMax) return;

    try {
      if (state.status == PhotoStatus.initial) {
        final photos = await photoRepository.fetchPhotos();

        return emit(state.copyWith(
          status: PhotoStatus.success,
          photos: photos,
          hasReachedMax: false,
        ));
      }

      final photos = await photoRepository.fetchPhotos(state.photos.length);

      photos.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
              state.copyWith(
                status: PhotoStatus.success,
                photos: List.of(state.photos)..addAll(photos),
                hasReachedMax: false,
              ),
            );
    } catch (_) {
      emit(state.copyWith(status: PhotoStatus.failure));
    }
  }
}
