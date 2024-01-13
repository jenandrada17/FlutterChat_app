
import 'package:json_annotation/json_annotation.dart';
part 'image_model.g.dart';

@JsonSerializable()
class PixelfordImage{

  // String id;
  // String filename;
  // String? title;
  //
  // @JsonKey(name: 'url_full_size')
  // String urlFullSize;
  //
  // @JsonKey(name: 'url_small_size')
  // String urlSmallSize;

  // PixelformImage({
  //   required this.id,
  //   required this.filename,
  //   this.title,
  //   required this.urlFullSize,
  //   required this.urlSmallSize});

  String id;
  String download_url;

  // @JsonKey(name: 'description')
  // String description;

  // @JsonKey(name: 'user')
  // String user;

  PixelfordImage({
    required this.id,
    required this.download_url});

  factory PixelfordImage.fromJson(Map<String, dynamic> json) => _$PixelfordImageFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PixelfordImageToJson(this);
}