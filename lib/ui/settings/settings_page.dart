import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../utils/context_extensions.dart';
import '../home/widgets/flutter_nav_bar.dart';
import '../wallpaper/gradient_bg.dart';
import 'theme_widget.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: const NavBar(),
      body: GradientBackground(
        child: Column(
          children: <Widget>[
            Gap(size.height * 0.1),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ThemeWidget(),
            ),
            const Gap(30),
            SettingsCard(
              title: 'Login',
              onTap: () => context.go('/login'),
            ),
            SettingsCard(
              title: 'Logout',
              onTap: () => context.go('/logout'),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsCard extends StatelessWidget {
  const SettingsCard({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: context.theme.primaryColorDark,
        ),
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(title, style: context.theme.primaryTextTheme.bodyLarge),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
