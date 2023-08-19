// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

import '../../data/getstore/get_store_helper.dart';
import '../../di/components/service_locator.dart';
import '../../ui/auth/login_page.dart';
import '../../ui/error/not_found_page.dart';
import '../../ui/home/home.dart';
import 'fade_extension.dart';

GetStoreHelper getStoreHelper = getIt<GetStoreHelper>();

enum SGRoute {
  home,
  login;

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
    ],
    errorBuilder: (BuildContext context, GoRouterState state) => NotFoundPage(
      title: 'errorState ${state.error} - ${state.location}',
    ),
  );
  GoRouter get getGoRouter => goRoute;
}

/// Example: Auth guard for Route Protection. GetStoreHelper is used to get token.
final String? Function(BuildContext context, GoRouterState state) _authGuard =
    (BuildContext context, GoRouterState state) {
  if (!(getStoreHelper.getToken() != null)) {
    return SGRoute.login.route;
  }
  return null;
};
