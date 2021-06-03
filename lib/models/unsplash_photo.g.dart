// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unsplash_photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnsplashPhotoModel _$UnsplashPhotoModelFromJson(Map<String, dynamic> json) {
  return UnsplashPhotoModel(
    color: json['color'] as String?,
    id: json['id'] as String?,
    urls: json['urls'] == null
        ? null
        : UnsplashUrlsModel.fromJson(json['urls'] as Map<String, dynamic>),
    likes: json['likes'] as int?,
    blurHash: json['blur_hash'] as String?,
    width: (json['width'] as num?)?.toDouble(),
    height: (json['height'] as num?)?.toDouble(),
    user: json['user'] == null
        ? null
        : UnsplashUserModel.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UnsplashPhotoModelToJson(UnsplashPhotoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'color': instance.color,
      'likes': instance.likes,
      'blur_hash': instance.blurHash,
      'width': instance.width,
      'height': instance.height,
      'urls': instance.urls,
      'user': instance.user,
    };
