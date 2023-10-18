import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import '../../../utils/context_extensions.dart';

class FeatureContainer extends StatelessWidget {
  const FeatureContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: context.theme.primaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
        child: Row(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Positive vibes',
                  style: context.theme.primaryTextTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Gap(5),
                Text(
                  'Boost your mood with\npositive vibes',
                  style: context.theme.primaryTextTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                GestureDetector(
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: context.theme.colorScheme.primaryContainer,
                        ),
                        child: Icon(
                          Icons.play_arrow,
                          size: 18,
                          color: context.colorScheme.inverseSurface,
                        ),
                      ),
                      const Gap(8),
                      Text(
                        '10 Mins',
                        style: context.theme.primaryTextTheme.bodyLarge,
                      ),
                    ],
                  ),
                  onTap: () {
                    context.go('/feature');
                  },
                ),
                const Gap(5),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
