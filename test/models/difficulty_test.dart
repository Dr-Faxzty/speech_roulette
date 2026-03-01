import 'package:flutter_test/flutter_test.dart';
import 'package:speech_roulette/data/models/difficulty.dart';

void main() {
  group('Difficulty enum', () {
    test('assetPath is not empty for each value', () {
      for (final d in Difficulty.values) {
        expect(d.assetPath, isNotEmpty);
      }
    });

    test('off has correct assetPath', () {
      expect(Difficulty.off.assetPath, contains('off.png'));
    });

    test('shakeIntensity is positive for easy/medium/hard only', () {
      for (final d in [Difficulty.easy, Difficulty.medium, Difficulty.hard]) {
        expect(d.shakeIntensity, greaterThan(0));
      }
      expect(Difficulty.geek.shakeIntensity, equals(0));
      expect(Difficulty.off.shakeIntensity, equals(0));
    });
  });
}