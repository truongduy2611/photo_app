import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:photo_app/models/unsplash_photo.dart';
import 'package:photo_app/repositories/photo/repository.dart';

part 'today_photo_event.dart';
part 'today_photo_state.dart';

class TodayPhotoBloc extends Bloc<TodayPhotoEvent, TodayPhotoState> {
  TodayPhotoBloc({
    required this.photoRepository,
  }) : super(TodayPhotoInitial());

  final PhotoRepository photoRepository;

  @override
  Stream<TodayPhotoState> mapEventToState(
    TodayPhotoEvent event,
  ) async* {
    if (event is FetchNewPhotoEvent) {
      final response = await photoRepository.api.fetchRandomPhoto();

      if (response.isSuccess) {
        yield TodayPhotoLoaded(response.data!);
      } else {
        yield TodayPhotoError(response.message);
      }
    }
  }
}
