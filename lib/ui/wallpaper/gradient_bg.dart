import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/context_extensions.dart';

class GradientBackground extends ConsumerWidget {
  const GradientBackground({super.key, this.child, this.gradientColors});
  final List<Color>? gradientColors;

  final Widget? child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: gradientColors ??
              <Color>[
                context.colorScheme.primaryContainer,
                context.colorScheme.secondaryContainer,
              ],
        ),
      ),
      child: child,
    );
  }
}
