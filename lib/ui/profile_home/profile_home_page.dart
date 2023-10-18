import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../utils/context_extensions.dart';
import '../home/widgets/app_bar_gone.dart';
import '../home/widgets/flutter_nav_bar.dart';

import 'widgets/exercise_part.dart';
import 'widgets/feature_container.dart';
import 'widgets/feeling_bubble.dart';
import 'widgets/part_row.dart';

class ProfileHomePage extends StatefulWidget {
  const ProfileHomePage({super.key});

  @override
  State<ProfileHomePage> createState() => _ProfileHomePageState();
}

class _ProfileHomePageState extends State<ProfileHomePage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<Widget> items = <Widget>[
    const FeatureContainer(),
    const FeatureContainer(),
    const FeatureContainer(),
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: const EmptyAppBar(),
      bottomNavigationBar: const NavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Gap(30),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 5),
                child: Text(
                  'Hello, Bumblebee',
                  style: context.theme.textTheme.headlineMedium,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  'How are you feeling today?',
                  style: context.theme.textTheme.titleLarge!.copyWith(
                    color: context.theme.hintColor,
                  ),
                ),
              ),
            ),
            Gap(size.height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FeelingBubble(
                  text: 'Love',
                  icon: Icon(
                    FluentIcons.heart_circle_20_filled,
                    size: 40,
                    color: context.theme.colorScheme.primary,
                  ),
                ),
                Gap(size.width * 0.04),
                FeelingBubble(
                  text: 'Cool',
                  icon: Icon(
                    FluentIcons.emoji_sparkle_20_filled,
                    size: 40,
                    color: context.theme.colorScheme.primary,
                  ),
                ),
                Gap(size.width * 0.04),
                FeelingBubble(
                  text: 'Happy',
                  icon: Icon(
                    FluentIcons.emoji_laugh_20_filled,
                    size: 40,
                    color: context.theme.colorScheme.primary,
                  ),
                ),
                Gap(size.width * 0.04),
                FeelingBubble(
                  text: 'Sad',
                  icon: Icon(
                    FluentIcons.emoji_sad_20_filled,
                    size: 40,
                    color: context.theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
            Gap(size.height * 0.01),
            const PartRow(
              text: 'Feature',
            ),
            Gap(size.height * 0.01),
            CarouselSlider(
              items: items,
              carouselController: _controller,
              options: CarouselOptions(
                height: 180,
                enlargeCenterPage: true,
                viewportFraction: 0.9,
                onPageChanged: (int index, CarouselPageChangedReason reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                  items.asMap().entries.map((MapEntry<int, Widget> entry) {
                return Container(
                  width: 7.0,
                  height: 7.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 3.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                );
              }).toList(),
            ),
            Gap(size.height * 0.01),
            const PartRow(
              text: 'Exercise',
            ),
            Gap(size.height * 0.01),
            const ExercisePart(),
          ],
        ),
      ),
    );
  }
}
