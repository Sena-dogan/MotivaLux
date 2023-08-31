import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../utils/context_extensions.dart';
import '../home/widgets/flutter_nav_bar.dart';
import 'gradient_bg.dart';
import 'wallpaper_item.dart';

class WallpaperPage extends ConsumerWidget {
  const WallpaperPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      bottomNavigationBar: const NavBar(),
      body: GradientBackground(
        gradientColors: <Color>[
          context.colorScheme.primaryContainer,
          context.colorScheme.primary,
        ],
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const Gap(30),
              GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                padding: EdgeInsets.zero,
                children: packageList,
              ),
              const Gap(100),
              Text(
                'Wallpaper',
                style: context.textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<WallpaperItem> packageList = <WallpaperItem>[
  const WallpaperItem(),
  const WallpaperItem(),
  const WallpaperItem(),
  const WallpaperItem(),
  const WallpaperItem(),
  const WallpaperItem(),
];
