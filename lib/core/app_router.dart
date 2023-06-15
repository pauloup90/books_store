import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../presentation/view/home_screen.dart';
import '../presentation/view/slplash_screen.dart';

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: '/HomeScreen',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
      ),
      // GoRoute(
      //   path: '/BookDetails',
      //   builder: (BuildContext context, GoRouterState state) {
      //     return const BookDetails();
      //   },
      // ),
    ],
  );
}
