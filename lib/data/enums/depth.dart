enum Depth {
  superficial,
  midDetailed,
  detailed,
}

extension DepthExtension on Depth {
  String get value {
    switch (this) {
      case Depth.superficial:
        return 'Superficial';
      case Depth.midDetailed:
        return 'Mid-detailed';
      case Depth.detailed:
        return 'Detailed';
    }
  }
}
