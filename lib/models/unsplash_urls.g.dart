// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unsplash_urls.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnsplashUrlsModel _$UnsplashUrlsModelFromJson(Map<String, dynamic> json) {
  return UnsplashUrlsModel(
    raw: json['raw'] as String?,
    full: json['full'] as String?,
    regular: json['regular'] as String?,
    small: json['small'] as String?,
    thumb: json['thumb'] as String?,
    medium: json['medium'] as String?,
    large: json['large'] as String?,
  );
}

Map<String, dynamic> _$UnsplashUrlsModelToJson(UnsplashUrlsModel instance) =>
    <String, dynamic>{
      'raw': instance.raw,
      'full': instance.full,
      'regular': instance.regular,
      'small': instance.small,
      'thumb': instance.thumb,
      'medium': instance.medium,
      'large': instance.large,
    };
