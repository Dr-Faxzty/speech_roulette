import 'package:flutter_test/flutter_test.dart';
import 'package:speech_roulette/core/utils/topic_loader.dart';

void main() {
  group('TopicLoader.getRandomTopic', () {
    test('returns a non-empty topic for known difficulties', () {
      final easy = TopicLoader.getRandomTopic('easy');
      final medium = TopicLoader.getRandomTopic('medium');
      final hard = TopicLoader.getRandomTopic('hard');
      final geek = TopicLoader.getRandomTopic('geek');

      expect(easy, isNotEmpty);
      expect(medium, isNotEmpty);
      expect(hard, isNotEmpty);
      expect(geek, isNotEmpty);
    });

    test('returns fallback for unknown difficulty', () {
      final topic = TopicLoader.getRandomTopic('does_not_exist');
      expect(topic, equals('Tema non disponibile'));
    });
  });
}