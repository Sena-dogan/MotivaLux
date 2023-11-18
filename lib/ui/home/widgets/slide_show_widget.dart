import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/home/slide.dart';
import '../logic/slide_show_logic.dart';

class PageviewSlide extends ConsumerStatefulWidget {
  const PageviewSlide({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PageviewSlideState();
}

class _PageviewSlideState extends ConsumerState<PageviewSlide> {
  @override
  void initState() {
    super.initState();
    ref.read(fetchSlidesProvider.future).then((List<Slide> slides) =>
        ref.read(slideShowLogicProvider.notifier).setSlides(slides));
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return PageView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        for (final Slide slide in ref.watch(slideShowLogicProvider).slides)
          SlideWidget(
            size: size,
            slide: slide,
          )
      ],
    );
  }
}

class SlideWidget extends ConsumerStatefulWidget {
  const SlideWidget({
    super.key,
    required this.slide,
    required this.size,
  });

  final Slide slide;
  final Size size;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SlideWidgetState();
}

class _SlideWidgetState extends ConsumerState<SlideWidget>
    with TickerProviderStateMixin {
  late AnimationController _mainTextController;
  late AnimationController _authorTextController;
  late Animation<double> _mainTextAnimation;
  late Animation<double> _authorTextAnimation;

  @override
  void initState() {
    super.initState();

    _mainTextController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _authorTextController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _mainTextAnimation = CurvedAnimation(
      parent: _mainTextController,
      curve: Curves.easeIn,
    );

    _authorTextAnimation = CurvedAnimation(
      parent: _authorTextController,
      curve: Curves.easeIn,
    );

    _mainTextController.forward();

    Future.delayed(
      const Duration(seconds: 1),
      () {
        if (mounted) 
        {
          _authorTextController.forward();
        }
      },
    );
  }

  @override
  void dispose() {
    //debugPrint('SlideWidget disposed');
    _mainTextController.dispose();
    _authorTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size.width,
      height: widget.size.height,
      color: Colors.transparent,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(
              flex: 2,
            ),
            MainText(
              ref: ref,
              widget: widget,
              mainTextAnimation: _mainTextAnimation,
            ),
            const Gap(11),
            if (widget.slide.author == null)
              Container()
            else
              AuthorText(
                  authorTextAnimation: _authorTextAnimation, widget: widget),
            const Spacer(),
            ActionsWidget(widget: widget),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class MainText extends ConsumerWidget {
  const MainText({
    super.key,
    required this.ref,
    required this.widget,
    required this.mainTextAnimation,
  });

  final WidgetRef ref;
  final SlideWidget widget;
  final Animation<double> mainTextAnimation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onDoubleTap: () =>
          ref.read(slideShowLogicProvider.notifier).setFavorite(widget.slide),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 34.0),
        child: FadeTransition(
          opacity: mainTextAnimation,
          child: Text(
            widget.slide.text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              height: 2,
              letterSpacing: 1,
              color: Colors.white,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(2.0, 2.0),
                  blurRadius: 3.0,
                ),
                Shadow(
                  offset: Offset(2.0, 2.0),
                  blurRadius: 8.0,
                  color: Color.fromARGB(125, 0, 0, 255),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AuthorText extends StatelessWidget {
  const AuthorText({
    super.key,
    required this.authorTextAnimation,
    required this.widget,
  });

  final Animation<double> authorTextAnimation;
  final SlideWidget widget;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: authorTextAnimation,
      child: Text('— ${widget.slide.author}',
          style: GoogleFonts.dancingScript(
            color: Colors.grey[200],
            fontSize: 27,
            shadows: <Shadow>[
              const Shadow(
                offset: Offset(2.0, 2.0),
                blurRadius: 3.0,
              ),
              const Shadow(
                offset: Offset(2.0, 2.0),
                blurRadius: 8.0,
                color: Color.fromARGB(125, 0, 0, 255),
              ),
            ],
          )),
    );
  }
}

class ActionsWidget extends ConsumerWidget {
  const ActionsWidget({
    super.key,
    required this.widget,
  });

  final SlideWidget widget;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          iconSize: 35,
          icon: widget.slide.isFavorite
              ? const Icon(Icons.favorite)
              : const Icon(Icons.favorite_border),
          color: Colors.white,
          onPressed: () {
            ref.read(slideShowLogicProvider.notifier).setFavorite(widget.slide);
            // Handle like action here
          },
        ),
        IconButton(
          iconSize: 35,
          icon: const Icon(Icons.ios_share_outlined),
          color: Colors.white,
          onPressed: () {
            // Handle share action here
          },
        ),
      ],
    );
  }
}
