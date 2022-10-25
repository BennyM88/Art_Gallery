import 'package:json_annotation/json_annotation.dart';

part 'photos.g.dart';

@JsonSerializable()
class Photos {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  Photos({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory Photos.fromJson(Map<String, dynamic> json) => _$PhotosFromJson(json);
  Map<String, dynamic> toJson() => _$PhotosToJson(this);
}
