import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
      backgroundColor: context.theme.scaffoldBackgroundColor,
      selectedItemColor: context.theme.primaryColor,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(
        size: 25,
        color: context.theme.iconTheme.color,
      ),
      unselectedIconTheme: IconThemeData(
        size: 25,
        color: context.theme.iconTheme.color?.withOpacity(0.7),
      ),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.format_quote_rounded, size: 30,),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_rounded),
          label: 'Likes',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.grid_view_rounded, size: 30,),
          label: 'Wallpapers',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_rounded),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings_rounded),
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
            context.go('/wallpaper');
            break;
          case 3:
            context.go('/profile_home');
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
