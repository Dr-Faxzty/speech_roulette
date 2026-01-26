enum Difficulty {
  easy,
  medium,
  hard,
  geek,
  off;

  String get assetPath {
    switch (this) {
      case Difficulty.easy:
        return 'assets/img/difficulty/easy.png';
      case Difficulty.medium:
        return 'assets/img/difficulty/medium.png';
      case Difficulty.hard:
        return 'assets/img/difficulty/hard.png';
      case Difficulty.geek:
        return 'assets/img/gif/penguin.gif';
      case Difficulty.off:
        return 'assets/img/difficulty/off.png';
    }
  }

  int get shakeIntensity {
    switch (this) {
      case Difficulty.easy:
        return 1;
      case Difficulty.medium:
        return 2;
      case Difficulty.hard:
        return 4;
      default:
        return 0;
    }
  }
}
