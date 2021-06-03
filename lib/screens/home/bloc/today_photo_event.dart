part of 'today_photo_bloc.dart';

abstract class TodayPhotoEvent extends Equatable {
  const TodayPhotoEvent();

  @override
  List<Object> get props => [];
}

class FetchNewPhotoEvent extends TodayPhotoEvent {}
