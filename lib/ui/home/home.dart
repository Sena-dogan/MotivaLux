// ignore_for_file: always_specify_types

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/drawer_menu_widget.dart';
import 'widgets/flutter_nav_bar.dart';
import 'widgets/slide_show_widget.dart';


class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        key: scaffoldKey,
        //appBar: const EmptyAppBar(),
        //bottomNavigationBar: const BottomNavBar(),
        drawer: const DrawerMenuWidget(),
        backgroundColor: Colors.transparent,
        bottomNavigationBar: const NavBar(),
        body: Stack(
          children: <Widget>[
            const Positioned.fill(
              child: Image(
                image: AssetImage('assets/img/walpaper3.png'),
                fit: BoxFit.cover,
                opacity: AlwaysStoppedAnimation(0.7),
              ),
            ),
            // menu button

            const PageviewSlide(),
            Positioned(
              top: 40,
              left: 20,
              child: IconButton(
                onPressed: () {
                  debugPrint('Menu button pressed');
                  scaffoldKey.currentState!.openDrawer();
                },
                iconSize: 30,
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ),
            ),
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
