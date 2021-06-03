part of 'photo_list_bloc.dart';

abstract class PhotoListState extends Equatable {
  const PhotoListState();

  @override
  List<Object> get props => [];
}

class PhotoListInitial extends PhotoListState {}

class PhotoListLoaded extends PhotoListState {
  const PhotoListLoaded({required this.page, required this.photoList});

  final int page;
  final List<UnsplashPhotoModel> photoList;

  @override
  List<Object> get props => [page, photoList];
}

class PhotoListError extends PhotoListState {
  PhotoListError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
