// ignore_for_file: prefer_function_declarations_over_variables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

import '../../ui/auth/login_page.dart';
import '../../ui/error/not_found_page.dart';
import '../../ui/home/home.dart';
import '../../ui/settings/settings_page.dart';
import '../../ui/wallpaper/wallpaper_page.dart';
import 'fade_extension.dart';

enum SGRoute {
  home,
  login,
  settings,
  wallpaper;

  String get route => '/${toString().replaceAll('SGRoute.', '')}';
  String get name => toString().replaceAll('SGRoute.', '');
}

@Singleton()
class SGGoRouter {
  final GoRouter goRoute = GoRouter(
    initialLocation: SGRoute.home.route,
    debugLogDiagnostics: true,
    routes: <GoRoute>[
      GoRoute(
        path: SGRoute.login.route,
        builder: (BuildContext context, GoRouterState state) => LoginPage(),
      ).fade(),
      GoRoute(
        path: SGRoute.home.route,
        builder: (BuildContext context, GoRouterState state) => HomeScreen(),
        redirect: _authGuard,
      ).fade(),
      GoRoute(
        path: SGRoute.settings.route,
        builder: (BuildContext context, GoRouterState state) =>
            const SettingsPage(),
      ).fade(),
      GoRoute(
        path: SGRoute.wallpaper.route,
        builder: (BuildContext context, GoRouterState state) =>
            const WallpaperPage(),
      ).fade(),
    ],
    errorBuilder: (BuildContext context, GoRouterState state) => NotFoundPage(
      title: 'errorState ${state.error} - ${state.location}',
    ),
  );
  GoRouter get getGoRouter => goRoute;
}

final String? Function(BuildContext context, GoRouterState state) _authGuard =
    (BuildContext context, GoRouterState state) {
  if (FirebaseAuth.instance.currentUser == null) {
    debugPrint('SGGoRouter: AuthGuard: No user found, redirecting to login');
    return SGRoute.home.route; //SGRoute.login.route;
  }
  return SGRoute.home.route;
};
