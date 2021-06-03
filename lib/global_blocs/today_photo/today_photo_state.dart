part of 'today_photo_bloc.dart';

abstract class TodayPhotoState extends Equatable {
  const TodayPhotoState();

  @override
  List<Object> get props => [];
}

class TodayPhotoInitial extends TodayPhotoState {}

class TodayPhotoLoaded extends TodayPhotoState {
  TodayPhotoLoaded(this.photo);

  final UnsplashPhotoModel photo;

  @override
  List<Object> get props => [photo];
}

class TodayPhotoError extends TodayPhotoState {
  TodayPhotoError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
