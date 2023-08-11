enum ContentLength {
  short,
  medium,
  long,
}

extension ContentLengthExtension on ContentLength {
  String get value {
    switch (this) {
      case ContentLength.short:
        return 'Short';
      case ContentLength.medium:
        return 'Medium';
      case ContentLength.long:
        return 'Long';
    }
  }
}
