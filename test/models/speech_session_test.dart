import 'package:flutter_test/flutter_test.dart';
import 'package:speech_roulette/data/models/speech_session.dart';

void main() {
  group('SpeechSession', () {
    test('creates a valid session', () {
      final session = SpeechSession(
        topic: 'Frontend',
        difficulty: 'geek',
        slideCount: 7,
        orientation: 'landscape',
      );

      expect(session.topic, equals('Frontend'));
      expect(session.difficulty, equals('geek'));
      expect(session.slideCount, equals(7));
      expect(session.orientation, equals('landscape'));
    });
  });
}