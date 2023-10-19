// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slide_show_ui_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SlideShowUIModel _$$_SlideShowUIModelFromJson(Map<String, dynamic> json) =>
    _$_SlideShowUIModel(
      isLoading: json['isLoading'] as bool? ?? false,
      error: json['error'] as String?,
      slides: (json['slides'] as List<dynamic>?)
              ?.map((e) => Slide.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Slide>[],
    );

Map<String, dynamic> _$$_SlideShowUIModelToJson(_$_SlideShowUIModel instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'error': instance.error,
      'slides': instance.slides,
    };
