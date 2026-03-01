import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:speech_roulette/presentation/screens/home_screen.dart';

void main() {
  late GoRouter router;

  setUp(() {
    router = GoRouter(
      routes: [
        GoRoute(
          name: 'loading',
          path: '/loading',
          builder: (context, state) {
            return const Scaffold(
              body: Text('Loading Screen'),
            );
          },
        ),
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeScreen(),
        ),
      ],
    );
  });

  testWidgets('HomeScreen renders correctly', (tester) async {
    await tester.pumpWidget(
      MaterialApp.router(
        routerConfig: router,
      ),
    );

    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.text("Seleziona la difficolta'"), findsOneWidget);
    expect(find.text('Numero di slides'), findsOneWidget);
    expect(find.byIcon(Icons.play_arrow), findsOneWidget);
  });

  testWidgets('Play button triggers navigation', (tester) async {
    await tester.pumpWidget(
      MaterialApp.router(
        routerConfig: router,
      ),
    );

    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));

    await tester.ensureVisible(find.byIcon(Icons.play_arrow));
    await tester.tap(find.byIcon(Icons.play_arrow));

    await tester.pumpAndSettle(const Duration(milliseconds: 500));

    expect(find.text('Loading Screen'), findsOneWidget);
  });

  testWidgets('Geek penguin tap starts game', (tester) async {
    await tester.pumpWidget(
      MaterialApp.router(
        routerConfig: router,
      ),
    );

    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));

    await tester.tap(find.byType(Image).last);
    await tester.pumpAndSettle(const Duration(milliseconds: 500));

    expect(find.text('Loading Screen'), findsOneWidget);
  });
}