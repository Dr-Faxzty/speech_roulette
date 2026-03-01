import 'package:flutter_test/flutter_test.dart';
import 'package:speech_roulette/data/models/orientation.dart';

void main() {
  group('Orientation enum', () {
    test('contains portrait and landscape only', () {
      expect(Orientation.values.length, 2);
      expect(Orientation.values, contains(Orientation.portrait));
      expect(Orientation.values, contains(Orientation.landscape));
    });

    test('assetPath is correct', () {
      expect(
        Orientation.portrait.assetPath,
        equals('assets/img/orientation/phone.png'),
      );

      expect(
        Orientation.landscape.assetPath,
        equals('assets/img/orientation/computer.png'),
      );
    });

    test('name getter returns correct value', () {
      expect(Orientation.portrait.name, equals('Portrait'));
      expect(Orientation.landscape.name, equals('Landscape'));
    });

    test('assetPath is never empty', () {
      for (final o in Orientation.values) {
        expect(o.assetPath, isNotEmpty);
      }
    });

    test('name getter is capitalized', () {
      for (final o in Orientation.values) {
        expect(o.name[0], equals(o.name[0].toUpperCase()));
      }
    });
  });
}