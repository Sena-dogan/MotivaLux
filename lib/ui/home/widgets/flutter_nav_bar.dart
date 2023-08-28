import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:line_icons/line_icons.dart';

import '../../../../utils/context_extensions.dart';
import '../../../models/home/nav_bar_ui_model.dart';
import '../logic/nav_bar_logic.dart';


class NavBar extends ConsumerWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final BottomNavBarUiModel nav = ref.watch(bottomNavBarLogicProvider);
    return BottomNavigationBar(
      currentIndex: nav.navIndex,
      backgroundColor: Colors.black87,
      selectedItemColor: context.theme.primaryColor,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: const IconThemeData(
        size: 23,
        color: Colors.white,
      ),
      unselectedIconTheme: IconThemeData(
        size: 23,
        color: Colors.grey[400],
      ),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(LineIcons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(LineIcons.hippo),
          label: 'Meditation',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.grid_view_outlined),
          label: 'Walllpapers',
        ),
        BottomNavigationBarItem(
          icon: Icon(LineIcons.user),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(LineIcons.cog),
          label: 'Settings',
        )
      ],
      onTap: (int index) {
        ref.read(bottomNavBarLogicProvider.notifier).setNavIndex(index);
        switch (index) {
          case 0:
            context.go('/home');
            break;
          case 1:
            context.go('/likes');
            break;
          case 2:
            context.go('/search');
            break;
          case 3:
            context.go('/profile');
            break;
          case 4:
            context.go('/settings');
            break;
          default:
            context.go('/home');
        }
      },
    );
  }
}
