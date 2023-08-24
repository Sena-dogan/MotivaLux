

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../models/home/slide.dart';
import '../../../models/home/slide_show_ui_model.dart';


part 'slide_show_logic.g.dart';

@riverpod
Future<List<Slide>> fetchSlides(FetchSlidesRef ref) async {
  final List<Slide> slides = [
    const Slide(
      isVideo: true,
      mediaUrl: '',
      text:
          'You’ve gotta dance like there’s nobody watching, love like you’ll never be hurt, sing like there’s nobody listening, and live like it’s heaven on earth.',
      isFavorite: false,
      author: 'William W. Purkey',
    ),
    const Slide(
      isVideo: true,
      mediaUrl: '',
      text:
          'Fairy tales are more than true: not because they tell us that dragons exist, but because they tell us that dragons can be beaten.',
      isFavorite: false,
      author: 'Neil Gaiman',
    ),
    const Slide(
      isVideo: true,
      mediaUrl: '',
      text:
          'Magic is believing in yourself. If you can make that happen, you can make anything happen.',
      isFavorite: false,
    ),
    const Slide(
      isVideo: true,
      mediaUrl: '',
      text: 'Everything you can imagine is real.',
      isFavorite: false,
      author: 'Pablo Picasso',
    ),
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
