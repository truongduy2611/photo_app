import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:photo_app/utils/json_annotation_helpers.dart';

import 'unsplash_urls.dart';
import 'unsplash_user.dart';

part 'unsplash_photo.g.dart';

@JsonSerializable()
class UnsplashPhotoModel extends Equatable {
  const UnsplashPhotoModel({
    this.color,
    this.id,
    this.urls,
    this.likes,
    this.blurHash,
    this.width,
    this.height,
    this.user,
  });

  factory UnsplashPhotoModel.fromJson(Map<String, dynamic> json) {
    return _$UnsplashPhotoModelFromJson(json);
  }

  final String? id;
  final int? likes;

  @JsonKey(name: 'blur_hash')
  final String? blurHash;

  final double? width;
  final double? height;

  final UnsplashUrlsModel? urls;
  final UnsplashUserModel? user;

  @JsonKey(fromJson: colorFromHex, toJson: toColorHex)
  final Color? color;

  Map<String, dynamic> toJson() => _$UnsplashPhotoModelToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  List<Object?> get props => [
        color,
        id,
        urls,
        likes,
        blurHash,
        width,
        height,
        user,
      ];
}
