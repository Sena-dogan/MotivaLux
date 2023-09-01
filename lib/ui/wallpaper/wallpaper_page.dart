import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../home/widgets/flutter_nav_bar.dart';

class WallpaperPage extends ConsumerWidget {
  const WallpaperPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        bottomNavigationBar: const NavBar(),
        body: MasonryGridView.builder(
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: 8,
          itemBuilder: (BuildContext context, int index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/img/wp${index + 1}.png'),
          ),
        ));
  }
}


