// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_ui_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoginUiModel _$$_LoginUiModelFromJson(Map<String, dynamic> json) =>
    _$_LoginUiModel(
      isLoggedIn: json['isLoggedIn'] as bool? ?? false,
      isLoading: json['isLoading'] as bool? ?? false,
      error: json['error'] as String? ?? null,
    );

Map<String, dynamic> _$$_LoginUiModelToJson(_$_LoginUiModel instance) =>
    <String, dynamic>{
      'isLoggedIn': instance.isLoggedIn,
      'isLoading': instance.isLoading,
      'error': instance.error,
    };
