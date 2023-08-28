// ignore_for_file: always_specify_types

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../home/widgets/flutter_nav_bar.dart';
import 'auth_widget.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        key: scaffoldKey,
        bottomNavigationBar: const NavBar(),
        body: Stack(
          children: <Widget>[
            const Positioned.fill(
              child: Image(
                image: AssetImage('assets/img/login_bg.png'),
                fit: BoxFit.cover,
                //opacity: AlwaysStoppedAnimation(0.7),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: size.height * 0.1,
                left: size.width * 0.03,
                right: size.width * 0.03,
              ),
              child: const AuthSocialWidget(),
            ),
          ],
        ));
  }
}
