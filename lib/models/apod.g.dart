// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apod.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Apod _$ApodFromJson(Map<String, dynamic> json) => Apod(
      json['date'] as String,
      json['copyright'] as String,
      json['explanation'] as String,
      json['hdurl'] as String,
      json['media_type'] as String,
      json['service_version'] as String,
      json['title'] as String,
      json['url'] as String,
    );

Map<String, dynamic> _$ApodToJson(Apod instance) => <String, dynamic>{
      'date': instance.date,
      'copyright': instance.copyright,
      'explanation': instance.explanation,
      'hdurl': instance.hdurl,
      'media_type': instance.media_type,
      'service_version': instance.service_version,
      'title': instance.title,
      'url': instance.url,
    };
