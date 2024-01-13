// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PixelfordImage _$PixelfordImageFromJson(Map<String, dynamic> json) =>
    PixelfordImage(
      id: json['id'] as String,
      download_url: json['download_url'] as String
    );

Map<String, dynamic> _$PixelfordImageToJson(PixelfordImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'download_url': instance.download_url
    };

// PixelformImage _$PixelformImageFromJson(Map<String, dynamic> json) =>
//     PixelformImage(
//       id: json['id'] as String,
//       filename: json['filename'] as String,
//       title: json['title'] as String?,
//       urlFullSize: json['url_full_size'] as String,
//       urlSmallSize: json['url_small_size'] as String,
//     );
//
// Map<String, dynamic> _$PixelformImageToJson(PixelformImage instance) =>
//     <String, dynamic>{
//       'id': instance.id,
//       'filename': instance.filename,
//       'title': instance.title,
//       'url_full_size': instance.urlFullSize,
//       'url_small_size': instance.urlSmallSize,
//     };
