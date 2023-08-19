import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../home/widgets/drawer_menu_widget.dart';
import '../widgets/auth_widget.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.transparent,
      ),
      drawer: const DrawerMenuWidget(),
      //bottomNavigationBar: const BottomNavBar(),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: AuthSocialWidget(),
        ),
      ),
    );
  }
}
