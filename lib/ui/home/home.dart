// ignore_for_file: always_specify_types

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:motivation/ui/widgets/bottom_nav_bar.dart';

import '../../../utils/context_extensions.dart';

import '../widgets/app_bar_gone.dart';
import 'widgets/slide_show_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: const EmptyAppBar(),
        //bottomNavigationBar: const BottomNavBar(),
        backgroundColor: context.colorScheme.background,
        body: const Stack(
          children: <Widget>[
            Positioned.fill(
              child: Image(
                image: AssetImage('assets/img/wallpaper2.jpeg'),
                fit: BoxFit.cover,
                opacity: AlwaysStoppedAnimation(0.5),
              ),
            ),
            PageviewSlide(),
          ],
        ));
  }
}

class LanguageTile extends StatelessWidget {
  const LanguageTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      onChanged: (bool newValue) {
        /// Example: Change locale
        /// The initial locale is automatically determined by the library.
        /// Changing the locale like this will persist the selected locale.
        context.setLocale(newValue ? const Locale('tr') : const Locale('en'));
      },
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
      value: context.locale == const Locale('tr'),
      title: Text(
        tr('toggle_language'),
        style:
            Theme.of(context).textTheme.titleMedium!.apply(fontWeightDelta: 2),
      ),
    );
  }
}
