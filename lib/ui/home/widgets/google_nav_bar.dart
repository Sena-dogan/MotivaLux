import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import '../../../models/home/nav_bar_ui_model.dart';
import '../logic/nav_bar_logic.dart';



class GNavBar extends ConsumerWidget {
  const GNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    final BottomNavBarUiModel nav = ref.watch(bottomNavBarLogicProvider);
    return Container(
      height: size.height * 0.11,
      decoration: BoxDecoration(
        color: Colors.black,
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(.1),
          )
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: size.height * 0.01,
            left: size.width * 0.012,
            right: size.width * 0.012,
          ),
          child: GNav(
            tabBorderRadius: 30,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: const Color.fromARGB(90, 88, 85, 85),
            tabs: const <GButton>[
              GButton(
                padding: EdgeInsets.all(14),
                borderRadius: BorderRadius.all(Radius.circular(50)),
                icon: LineIcons.home,
                iconSize: 20,
                text: ' Home',
              ),
              GButton(
                padding: EdgeInsets.all(14),
                borderRadius: BorderRadius.all(Radius.circular(50)),
                icon: LineIcons.heart,
                iconSize: 20,
                text: ' Likes',
              ),
              GButton(
                padding: EdgeInsets.all(14),
                borderRadius: BorderRadius.all(Radius.circular(50)),
                icon: LineIcons.search,
                iconSize: 20,
                text: ' Search',
              ),
              GButton(
                padding: EdgeInsets.all(14),
                borderRadius: BorderRadius.all(Radius.circular(50)),
                icon: LineIcons.user,
                iconSize: 20,
                text: ' Profile',
              ),
            ],
            selectedIndex: nav.navIndex,
            onTabChange: (int index) {
              ref.read(bottomNavBarLogicProvider.notifier).setNavIndex(index);
            },
          ),
        ),
      ),
    );
  }
}
