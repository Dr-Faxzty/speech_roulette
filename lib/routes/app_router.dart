import 'package:go_router/go_router.dart';

import '../data/models/speech_session.dart';
import '../presentation/screens/home_screen.dart';
import '../presentation/screens/loading_screen.dart';
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
        path: '/loading',
        name: 'loading',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          return LoadingScreen(
            difficulty: extra['difficulty'] as String,
            slideCount: extra['slideCount'] as int,
            orientation: extra['orientation'] as String,
          );
        },
      ),
      GoRoute(
        path: '/presentation',
        name: 'presentation',
        builder: (context, state) {
          final session = state.extra as SpeechSession;
          return PresentationScreen(session: session);
        },
      ),
      GoRoute(
        path: '/applause',
        name: 'applause',
        builder: (context, state) => const ApplauseScreen(),
      ),
    ],
  );
}
