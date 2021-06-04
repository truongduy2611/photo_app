import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:photo_app/models/unsplash_photo.dart';
import 'package:photo_app/repositories/photo/repository.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'photo_list_event.dart';
part 'photo_list_state.dart';

class PhotoListBloc extends Bloc<PhotoListEvent, PhotoListState> {
  PhotoListBloc({
    required this.photoRepository,
    required this.refreshController,
  }) : super(PhotoListInitial());

  final PhotoRepository photoRepository;
  final RefreshController refreshController;

  @override
  Stream<PhotoListState> mapEventToState(
    PhotoListEvent event,
  ) async* {
    var page = 0;
    var photoList = <UnsplashPhotoModel>[];

    final currentState = state;
    if (currentState is PhotoListLoaded) {
      page = currentState.page;
      photoList = currentState.photoList;
    }

    if (event is FetchPhotoListEvent) {
      /// API page from 1 -> 0 + 1 for first page
      final response = await photoRepository.api.fetchPhotoList(page: page + 1);
      if (response.isSuccess) {
        yield PhotoListLoaded(
          page: page + 1,
          photoList: photoList + (response.data ?? []),
        );
      } else {
        yield PhotoListError(response.message);
      }
      event.onDone?.call();
    }

    if (event is RefreshPhotoListEvent) {
      final response = await photoRepository.api.fetchPhotoList(page: 1);
      if (response.isSuccess) {
        refreshController.refreshCompleted();
        yield PhotoListLoaded(
          page: 1,
          photoList: response.data ?? [],
        );
      } else {
        refreshController.refreshFailed();
        yield PhotoListError(response.message);
      }
    }
  }
}
