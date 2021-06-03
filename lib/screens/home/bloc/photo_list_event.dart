part of 'photo_list_bloc.dart';

abstract class PhotoListEvent extends Equatable {
  const PhotoListEvent();

  @override
  List<Object> get props => [];
}

class FetchPhotoListEvent extends PhotoListEvent {
  const FetchPhotoListEvent({this.onDone});

  final VoidCallback? onDone;
}

class RefreshPhotoListEvent extends PhotoListEvent {}
