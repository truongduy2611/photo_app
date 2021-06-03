// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unsplash_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnsplashUserModel _$UnsplashUserModelFromJson(Map<String, dynamic> json) {
  return UnsplashUserModel(
    username: json['username'] as String?,
    name: json['name'] as String?,
    profileImage: json['profile_image'] == null
        ? null
        : UnsplashUrlsModel.fromJson(
            json['profile_image'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UnsplashUserModelToJson(UnsplashUserModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'name': instance.name,
      'profile_image': instance.profileImage,
    };
