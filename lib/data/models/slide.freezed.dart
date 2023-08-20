// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'slide.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Slide _$SlideFromJson(Map<String, dynamic> json) {
  return _Slide.fromJson(json);
}

/// @nodoc
mixin _$Slide {
  String get text => throw _privateConstructorUsedError;
  String get mediaUrl => throw _privateConstructorUsedError;
  bool get isVideo => throw _privateConstructorUsedError;
  String? get author => throw _privateConstructorUsedError;
  bool get isFavorite => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SlideCopyWith<Slide> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SlideCopyWith<$Res> {
  factory $SlideCopyWith(Slide value, $Res Function(Slide) then) =
      _$SlideCopyWithImpl<$Res, Slide>;
  @useResult
  $Res call(
      {String text,
      String mediaUrl,
      bool isVideo,
      String? author,
      bool isFavorite});
}

/// @nodoc
class _$SlideCopyWithImpl<$Res, $Val extends Slide>
    implements $SlideCopyWith<$Res> {
  _$SlideCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? mediaUrl = null,
    Object? isVideo = null,
    Object? author = freezed,
    Object? isFavorite = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      mediaUrl: null == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isVideo: null == isVideo
          ? _value.isVideo
          : isVideo // ignore: cast_nullable_to_non_nullable
              as bool,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SlideCopyWith<$Res> implements $SlideCopyWith<$Res> {
  factory _$$_SlideCopyWith(_$_Slide value, $Res Function(_$_Slide) then) =
      __$$_SlideCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String text,
      String mediaUrl,
      bool isVideo,
      String? author,
      bool isFavorite});
}

/// @nodoc
class __$$_SlideCopyWithImpl<$Res> extends _$SlideCopyWithImpl<$Res, _$_Slide>
    implements _$$_SlideCopyWith<$Res> {
  __$$_SlideCopyWithImpl(_$_Slide _value, $Res Function(_$_Slide) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? mediaUrl = null,
    Object? isVideo = null,
    Object? author = freezed,
    Object? isFavorite = null,
  }) {
    return _then(_$_Slide(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      mediaUrl: null == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isVideo: null == isVideo
          ? _value.isVideo
          : isVideo // ignore: cast_nullable_to_non_nullable
              as bool,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Slide implements _Slide {
  const _$_Slide(
      {required this.text,
      required this.mediaUrl,
      required this.isVideo,
      this.author,
      required this.isFavorite});

  factory _$_Slide.fromJson(Map<String, dynamic> json) =>
      _$$_SlideFromJson(json);

  @override
  final String text;
  @override
  final String mediaUrl;
  @override
  final bool isVideo;
  @override
  final String? author;
  @override
  final bool isFavorite;

  @override
  String toString() {
    return 'Slide(text: $text, mediaUrl: $mediaUrl, isVideo: $isVideo, author: $author, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Slide &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.mediaUrl, mediaUrl) ||
                other.mediaUrl == mediaUrl) &&
            (identical(other.isVideo, isVideo) || other.isVideo == isVideo) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, text, mediaUrl, isVideo, author, isFavorite);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SlideCopyWith<_$_Slide> get copyWith =>
      __$$_SlideCopyWithImpl<_$_Slide>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SlideToJson(
      this,
    );
  }
}

abstract class _Slide implements Slide {
  const factory _Slide(
      {required final String text,
      required final String mediaUrl,
      required final bool isVideo,
      final String? author,
      required final bool isFavorite}) = _$_Slide;

  factory _Slide.fromJson(Map<String, dynamic> json) = _$_Slide.fromJson;

  @override
  String get text;
  @override
  String get mediaUrl;
  @override
  bool get isVideo;
  @override
  String? get author;
  @override
  bool get isFavorite;
  @override
  @JsonKey(ignore: true)
  _$$_SlideCopyWith<_$_Slide> get copyWith =>
      throw _privateConstructorUsedError;
}
