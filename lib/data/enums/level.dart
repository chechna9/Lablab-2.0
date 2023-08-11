enum Level {
  basic,
  medium,
  advanced,
}

extension LevelExtension on Level {
  String get value {
    switch (this) {
      case Level.basic:
        return 'Basic';
      case Level.medium:
        return 'Medium';
      case Level.advanced:
        return 'Advanced';
    }
  }
}
