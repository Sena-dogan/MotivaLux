import 'package:riverpod/src/framework.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/models/slide.dart';
import '../models/slide_show_ui_model.dart';

part 'slide_show_logic.g.dart';

@riverpod
Future<List<Slide>> fetchSlides(FetchSlidesRef ref) async {
  final List<Slide> slides = [
    const Slide(
      isVideo: true,
      mediaUrl: '',
      text: 'Başarısızlık yoktur. Deneyim vardır.',
      isFavorite: false,
    ),
    const Slide(
      isVideo: false,
      mediaUrl: '',
      text: 'Bumblebee is a Camaro.',
      isFavorite: false,
      author: 'Ejderiya',
    ),
    const Slide(
      isVideo: false,
      mediaUrl: '',
      text: 'I will buy a Challenger.',
      isFavorite: false,
      author: 'Sena',
    ),
  ];
  await Future<void>.delayed(const Duration(seconds: 2));
  return slides;
}

@riverpod
class SlideShowLogic extends _$SlideShowLogic {
  @override
  SlideShowUIModel build() {
    return const SlideShowUIModel(
      isLoading: true,
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

  void setFavorite(Slide slide) {
    final List<Slide> slides = state.slides.map((Slide e) {
      if (e.text == slide.text) {
        return e.copyWith(isFavorite: !e.isFavorite);
      }
      return e;
    }).toList();
    state = state.copyWith(slides: slides);
  }
}
