import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:speech_roulette/data/models/speech_session.dart';
import 'package:speech_roulette/data/models/unsplash_image.dart';
import 'package:speech_roulette/presentation/screens/presentation_screen.dart';

import '../mock/mocks.mocks.dart';

void main() {
  late GoRouter router;
  late MockIUnsplashService mockUnsplash;

  setUp(() {
    mockUnsplash = MockIUnsplashService();

    when(
      mockUnsplash.getRandomImages(
        count: anyNamed('count'),
        orientation: anyNamed('orientation'),
      ),
    ).thenAnswer((_) async => [
      UnsplashImage(
        id: '1',
        url: 'https://example.com/img1.jpg',
        author: 'Author 1',
        authorUrl: 'https://example.com/a1',
        width: 1000,
        height: 500,
      ),
      UnsplashImage(
        id: '2',
        url: 'https://example.com/img2.jpg',
        author: 'Author 2',
        authorUrl: 'https://example.com/a2',
        width: 800,
        height: 600,
      ),
    ]);

    router = GoRouter(
      routes: [
        GoRoute(
          name: 'applause',
          path: '/applause',
          builder: (_, __) => const Scaffold(body: Text('Applause Screen')),
        ),
        GoRoute(
          path: '/',
          builder: (context, state) => PresentationScreen(
            session: SpeechSession(
              topic: 'Frontend',
              difficulty: 'geek',
              slideCount: 2,
              orientation: 'landscape',
            ),
            unsplashService: mockUnsplash,
          ),
        ),
      ],
    );
  });

  testWidgets('renders topic and first slide', (tester) async {
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(MaterialApp.router(routerConfig: router));
      await tester.pumpAndSettle();

      expect(find.text('FRONTEND'), findsOneWidget);
      expect(find.text('1/2'), findsOneWidget);
      expect(find.text('Author 1'), findsOneWidget);

      verify(mockUnsplash.getRandomImages(count: 2, orientation: 'landscape'))
          .called(1);
    });
  });

  testWidgets('next button advances slide', (tester) async {
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(MaterialApp.router(routerConfig: router));
      await tester.pumpAndSettle();

      await tester.tap(find.text('next'));
      await tester.pumpAndSettle();

      expect(find.text('2/2'), findsOneWidget);
      expect(find.text('Author 2'), findsOneWidget);
    });
  });

  testWidgets('end navigates to applause', (tester) async {
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(MaterialApp.router(routerConfig: router));
      await tester.pumpAndSettle();

      await tester.tap(find.text('next'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('end'));
      await tester.pumpAndSettle();

      expect(find.text('Applause Screen'), findsOneWidget);
    });
  });
}