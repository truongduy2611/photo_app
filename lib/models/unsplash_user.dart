import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'unsplash_urls.dart';

part 'unsplash_user.g.dart';

@JsonSerializable()
class UnsplashUserModel extends Equatable {
  const UnsplashUserModel({
    this.username,
    this.name,
    this.profileImage,
  });

  factory UnsplashUserModel.fromJson(Map<String, dynamic> json) {
    return _$UnsplashUserModelFromJson(json);
  }

  final String? username;
  final String? name;

  @JsonKey(name: 'profile_image')
  final UnsplashUrlsModel? profileImage;

  Map<String, dynamic> toJson() => _$UnsplashUserModelToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  List<Object?> get props => [
        username,
        name,
        profileImage,
      ];
}
