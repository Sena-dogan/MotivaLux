import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/context_extensions.dart';

class PartRow extends StatelessWidget {
  const PartRow({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Gap(20),
        Text(
          text,
          style: GoogleFonts.roboto(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: Row(
            children: <Widget>[
              Text(
                'See more',
                style: GoogleFonts.roboto(
                    fontSize: 16,
                    color: context.theme.colorScheme.secondary,
                    fontWeight: FontWeight.bold),
              ),
              const Gap(4),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: context.theme.colorScheme.secondary,
              ),
              const Gap(10),
            ],
          ),
        ),
      ],
    );
  }
}
