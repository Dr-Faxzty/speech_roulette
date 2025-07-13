import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../presentation/screens/home_screen.dart';
import '../presentation/screens/intro_screen.dart';
import '../presentation/screens/presentation_screen.dart';
import '../presentation/screens/applause_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/intro',
        name: 'intro',
        builder: (context, state) => const IntroScreen(),
      ),
      GoRoute(
        path: '/presentation',
        name: 'presentation',
        builder: (context, state) => const PresentationScreen(),
      ),
      GoRoute(
        path: '/applause',
        name: 'applause',
        builder: (context, state) => const ApplauseScreen(),
      ),
    ],
  );
}
