import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'unsplash_urls.g.dart';

@JsonSerializable()
class UnsplashUrlsModel extends Equatable {
  const UnsplashUrlsModel({
    this.raw,
    this.full,
    this.regular,
    this.small,
    this.thumb,
    this.medium,
    this.large,
  });

  factory UnsplashUrlsModel.fromJson(Map<String, dynamic> json) {
    return _$UnsplashUrlsModelFromJson(json);
  }

  final String? raw;
  final String? full;
  final String? regular;
  final String? small;
  final String? thumb;
  final String? medium;
  final String? large;

  Map<String, dynamic> toJson() => _$UnsplashUrlsModelToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  List<Object?> get props => [
        raw,
        full,
        regular,
        small,
        thumb,
        medium,
        large,
      ];
}
