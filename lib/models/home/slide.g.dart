// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slide.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Slide _$$_SlideFromJson(Map<String, dynamic> json) => _$_Slide(
      text: json['text'] as String,
      mediaUrl: json['mediaUrl'] as String,
      isVideo: json['isVideo'] as bool,
      author: json['author'] as String?,
      isFavorite: json['isFavorite'] as bool,
    );

Map<String, dynamic> _$$_SlideToJson(_$_Slide instance) => <String, dynamic>{
      'text': instance.text,
      'mediaUrl': instance.mediaUrl,
      'isVideo': instance.isVideo,
      'author': instance.author,
      'isFavorite': instance.isFavorite,
    };
