import 'package:flutter/material.dart';
import 'package:motivation/ui/home/models/slide_show_ui_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'slide_show_logic.g.dart';

@riverpod
class SlideShowLogic extends _$SlideShowLogic {
  @override
  SlideShowUIModel build() {
    return const SlideShowUIModel(
      isLoading: true,
      slides: [],
      error: null,
    );
  }

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  void setError(String? error) {
    state = state.copyWith(
      error: error,
      isLoading: false,
    );
  }

  void setSlides(List<Slide> slides) {
    state = state.copyWith(
      slides: slides,
      isLoading: false,
    );
  }

  dynamic getSlides({Function()? onSuccess}) async {
    state = state.copyWith(isLoading: true, slides: [
      const Slide(isVideo: false, mediaUrl: '', text: 'Başarısızlık yoktur. Deneyim vardır.'),
      const Slide(isVideo: false, mediaUrl: '', text: 'Bumblebee is a Camaro.'),
      const Slide(isVideo: false, mediaUrl: '', text: 'I will buy a Challenger.'),
    ]);
  }
}
