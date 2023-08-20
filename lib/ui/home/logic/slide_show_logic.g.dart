// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slide_show_logic.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchSlidesHash() => r'f2c5d1141eadd3e26dc9387455cd19f9c46f6ed8';

/// See also [fetchSlides].
@ProviderFor(fetchSlides)
final fetchSlidesProvider = AutoDisposeFutureProvider<List<Slide>>.internal(
  fetchSlides,
  name: r'fetchSlidesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$fetchSlidesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchSlidesRef = AutoDisposeFutureProviderRef<List<Slide>>;
String _$slideShowLogicHash() => r'7eecbd8088599eab7a80b2be2210ad65455f21b0';

/// See also [SlideShowLogic].
@ProviderFor(SlideShowLogic)
final slideShowLogicProvider =
    AutoDisposeNotifierProvider<SlideShowLogic, SlideShowUIModel>.internal(
  SlideShowLogic.new,
  name: r'slideShowLogicProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$slideShowLogicHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SlideShowLogic = AutoDisposeNotifier<SlideShowUIModel>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
