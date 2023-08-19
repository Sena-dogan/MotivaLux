import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_ui_model.freezed.dart';
part 'login_ui_model.g.dart';

@freezed
abstract class LoginUiModel with _$LoginUiModel {
  const factory LoginUiModel({
    @Default(false) bool isLoggedIn,
    @Default(false) bool isLoading,
    @Default(null) String? error,
  }) = _LoginUiModel;

  factory LoginUiModel.fromJson(Map<String, dynamic> json) => _$LoginUiModelFromJson(json);
}
