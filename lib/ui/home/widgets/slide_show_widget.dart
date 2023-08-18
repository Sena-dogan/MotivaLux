import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

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
          author: 'Bob Marley',
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
        SlideWidget(
          size: size,
          text:
              'LOVE IS A PROMISE; LOVE IS A SOUVENIR, ONCE GIVEN NEVER FORGOTTEN, NEVER LET IT DISAPPEAR.',
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
