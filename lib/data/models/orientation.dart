enum Orientation {
  portrait,
  landscape;

  String get assetPath {
    switch (this) {
      case Orientation.portrait:
        return 'assets/img/orientation/phone.png';
      case Orientation.landscape:
        return 'assets/img/orientation/computer.png';
    }
  }

  String get name {
    switch (this) {
      case Orientation.portrait:
        return 'Portrait';
      case Orientation.landscape:
        return 'Landscape';
    }
  }
}