import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/models/slide.dart';
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
            text: slide.text,
          )
      ],
    );
  }
}

class SlideWidget extends ConsumerWidget {
  const SlideWidget({
    super.key,
    required this.size,
    required this.text,
    this.author,
  });
  final String text;
  final Size size;
  final String? author;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: size.width,
      height: size.height,
      color: Colors.transparent,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 34.0),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
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
            const Gap(11),
            if (author == null)
              Container()
            else
              Text('— $author',
                  style: GoogleFonts.dancingScript(
                    color: Colors.grey[200],
                    fontSize: 25,
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
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  iconSize: 35,
                  icon: const Icon(Icons.favorite_outline_sharp),
                  color: Colors.white,
                  onPressed: () {
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
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
