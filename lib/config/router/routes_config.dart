import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/stock_list/presentation/pages/pages.dart';
import 'routes.dart';

class RoutesConfig {
  static final navigationKey = GlobalKey<NavigatorState>();
  static final routeConfig = GoRouter(
    initialLocation: '/',
    navigatorKey: navigationKey,
    routes: routes,
    errorPageBuilder: (ctx, state) => MaterialPage(
      key: state.pageKey,
      child: const ErrorPage(),
    ),
  );
}
