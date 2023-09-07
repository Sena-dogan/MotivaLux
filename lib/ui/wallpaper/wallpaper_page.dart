import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/context_extensions.dart';
import '../home/widgets/app_bar_gone.dart';
import '../home/widgets/flutter_nav_bar.dart';

class WallpaperPage extends ConsumerWidget {
  const WallpaperPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> images = [
      'assets/img/wp1.png',
      'assets/img/wp2.png',
      'assets/img/wp3.png',
      'assets/img/wp4.png',
      'assets/img/wp5.png',
      'assets/img/wp6.png',
      'assets/img/wp7.png',
      'assets/img/wp8.png',
    ];

    return Scaffold(
      backgroundColor: context.colorScheme.background,
      bottomNavigationBar: const NavBar(),
      appBar: const EmptyAppBar(),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        semanticChildCount: images.length,
        childAspectRatio: 0.6,
        mainAxisSpacing: 11,
        children: images
            .map(
              (String e) => Card(
                elevation: 4,
                shadowColor: context.colorScheme.shadow,
                child: Image.asset(e, fit: BoxFit.cover),
              ),
            )
            .toList(),
      ),
    );
  }
}
