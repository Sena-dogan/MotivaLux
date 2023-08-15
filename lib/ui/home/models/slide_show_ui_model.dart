import 'package:freezed_annotation/freezed_annotation.dart';

part 'slide_show_ui_model.freezed.dart';
part 'slide_show_ui_model.g.dart';

@freezed
abstract class Slide with _$Slide {
  const factory Slide({
    required String text,
    required String mediaUrl,
    required bool isVideo,
  }) = _Slide;

  factory Slide.fromJson(Map<String, dynamic> json) => _$SlideFromJson(json);
}

@freezed
abstract class SlideShowUIModel with _$SlideShowUIModel {
  const factory SlideShowUIModel({
    @Default(false) bool isLoading,
    @Default(null) String? error,
    @Default(<Slide>[]) List<Slide> slides,
  }) = _SlideShowUIModel;

  factory SlideShowUIModel.fromJson(Map<String, dynamic> json) =>
      _$SlideShowUIModelFromJson(json);
}

