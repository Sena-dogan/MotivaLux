import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/router/app_router.dart';

class DrawerMenuWidget extends StatelessWidget {
  const DrawerMenuWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Drawer(
      elevation: 3,
      width: size.width * 0.5,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Gap(size.height * 0.1),
          MenuItem(
            title: 'Home',
            onTap: () {
              context.go(SGRoute.home.route);
            },
            icon: const Icon(
              Icons.home_outlined,
            ),
          ),
          MenuItem(
            title: 'Profile',
            onTap: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.person_outline_rounded,
            ),
          ),
          MenuItem(
            title: 'Login',
            onTap: () {
              context.go(SGRoute.login.route);
            },
            icon: const Icon(
              Icons.login_rounded,
            ),
          ),
          MenuItem(
            title: 'Logout',
            onTap: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.logout_rounded,
            ),
          ),
          MenuItem(
            title: 'Favorites',
            onTap: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.favorite_border_rounded,
            ),
          ),
          MenuItem(
            title: 'Wallpapers',
            onTap: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.image_search_rounded,
            ),
          ),
          MenuItem(
            title: 'Categories',
            onTap: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.grid_view_outlined,
            ),
          ),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.title,
    required this.onTap,
    required this.icon,
  });
  final String title;
  final void Function()? onTap;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(title),
      onTap: onTap,
    );
  }
}
