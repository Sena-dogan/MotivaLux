import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageviewSlide extends ConsumerWidget {
  const PageviewSlide({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    return PageView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        SlideWidget(
          size: size,
          text:
              'LIFE IS TOO SHORT TO WAKE UP IN THE MORNING WITH REGRETS. SO LOVE THE PEOPLE WHO TREAT YOU RIGHT AND FORGET ABOUT THE ONES WHO DONT.',
        ),
        SlideWidget(
          size: size,
          text:
              'THE TRUTH IS EVERYONE IS GOING TO HURT YOU. YOU JUST GOT TO FIND THE ONES WORTH SUFFERING FOR.',
        ),
        SlideWidget(
          size: size,
          text:
              'THE BEST LOVE IS THE KIND THAT AWAKENS THE SOUL; THAT MAKES US REACH FOR MORE, THAT PLANTS THE FIRE IN OUR HEARTS AND BRINGS PEACE TO OUR MINDS. THATS WHAT I HOPE TO GIVE YOU FOREVER.',
        ),
        SlideWidget(
          size: size,
          text:
              'LOVE IS LIKE A FRIENDSHIP CAUGHT ON FIRE. IN THE BEGINNING A FLAME, VERY PRETTY, OFTEN HOT AND FIERCE, BUT STILL ONLY LIGHT AND FLICKERING. AS LOVE GROWS OLDER, OUR HEARTS MATURE AND OUR LOVE BECOMES AS COALS, DEEP-BURNING AND UNQUENCHABLE.',
        ),
      ],
    );
  }
}

class SlideWidget extends ConsumerWidget {
  const SlideWidget({
    super.key,
    required this.size,
    required this.text,
  });
  final String text;
  final Size size;

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
            Padding(
              padding: const EdgeInsets.all(34.0),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  iconSize: 40,
                  icon: const Icon(Icons.favorite_outline),
                  color: Colors.white,
                  onPressed: () {
                    // Handle like action here
                  },
                ),
                IconButton(
                  iconSize: 40,
                  icon: const Icon(Icons.thumb_down_alt_outlined),
                  color: Colors.white,
                  onPressed: () {
                    // Handle unlike action here
                  },
                ),
                IconButton(
                  iconSize: 40,
                  icon: const Icon(Icons.ios_share_outlined),
                  color: Colors.white,
                  onPressed: () {
                    // Handle share action here
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
