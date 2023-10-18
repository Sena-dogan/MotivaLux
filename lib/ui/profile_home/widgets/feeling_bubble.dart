import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../utils/context_extensions.dart';

class FeelingBubble extends StatelessWidget {
  const FeelingBubble({super.key, required this.text, required this.icon});
  final String text;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.theme.colorScheme.primaryContainer,
            ),
            child: icon,
          ),
          const Gap(6),
          SizedBox(
            child: Text(text, style: context.theme.textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }
}
