import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'photo.g.dart';

@JsonSerializable()
class PhotoModel extends Equatable {
  const PhotoModel({
    this.name,
    this.id,
    this.imageUrl,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) =>
      _$PhotoModelFromJson(json);

  final String? name;
  final String? imageUrl;
  final int? id;

  Map<String, dynamic> toJson() => _$PhotoModelToJson(this);

  @override
  List<Object?> get props => [name, id, imageUrl];
}
