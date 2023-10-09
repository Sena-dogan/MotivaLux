import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/context_extensions.dart';
import '../home/widgets/app_bar_gone.dart';
import '../home/widgets/flutter_nav_bar.dart';

class WallpaperPage extends ConsumerWidget {
  const WallpaperPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> images = <String>[
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
            .asMap()
            .entries
            .map(
              (MapEntry<int, String> entry) => RawMaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<dynamic>(
                      builder: (BuildContext buildContext) => Scaffold(
                        body: Stack(
                          children: <Widget>[
                            PageView(
                              controller:
                                  PageController(initialPage: entry.key),
                              children: images
                                  .map((String e) =>
                                      Image.asset(e, fit: BoxFit.cover))
                                  .toList(),
                            ),
                            Positioned(
                              top: 40,
                              left: 20,
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  size: 30,
                                  shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(2.0, 2.0),
                                      blurRadius: 10.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                child: Card(
                  elevation: 4,
                  shadowColor: context.colorScheme.shadow,
                  child: Image.asset(entry.value, fit: BoxFit.cover),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
