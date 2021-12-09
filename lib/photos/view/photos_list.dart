import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../photos.dart';

class PhotosList extends StatefulWidget {
  @override
  _PhotosListState createState() => _PhotosListState();
}

class _PhotosListState extends State<PhotosList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotoBloc, PhotoState>(
      builder: (context, state) {
        switch (state.status) {
          case PhotoStatus.failure:
            return const Center(child: Text('failed to fetch photos'));
          case PhotoStatus.success:
            if (state.photos.isEmpty) {
              return const Center(child: Text('no photos'));
            }
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return index >= state.photos.length
                    ? BottomLoader()
                    : PhotoListItem(photo: state.photos[index]);
              },
              itemCount: state.hasReachedMax
                  ? state.photos.length
                  : state.photos.length + 1,
              controller: _scrollController,
            );
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<PhotoBloc>().add(PhotoFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
