import 'package:freezed_annotation/freezed_annotation.dart';

part 'slide.g.dart';
part 'slide.freezed.dart';

@freezed
abstract class Slide with _$Slide {
  const factory Slide({
    required String text,
    required String mediaUrl,
    required bool isVideo,
    String? author,
    required bool isFavorite,
  }) = _Slide;

  factory Slide.fromJson(Map<String, dynamic> json) => _$SlideFromJson(json);
}
