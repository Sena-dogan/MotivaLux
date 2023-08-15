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
        Container(
          width: size.width,
          height: size.height,
          color: Theme.of(context).primaryColor,
          child: const Center(
            child: Text(
              'Page 1',
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Container(
          width: size.width,
          height: size.height,
          color: Theme.of(context).primaryColor,
          child: const Center(
            child: Text(
              'Page 2',
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Container(
          width: size.width,
          height: size.height,
          color: Theme.of(context).primaryColor,
          child: const Center(
            child: Text(
              'Page 3',
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}