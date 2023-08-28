import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../home/widgets/flutter_nav_bar.dart';
import '../home/widgets/theme_widget.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      bottomNavigationBar: const NavBar(),
      body: Column(
        children: <Widget>[
          const Gap(40),
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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Card(
        child: ListTile(
          title: Text(title),
          onTap: onTap,
        ),
      ),
    );
  }
}
