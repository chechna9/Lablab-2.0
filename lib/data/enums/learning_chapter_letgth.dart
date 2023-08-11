enum LearnigningChapterLength {
  short,
  medium,
  long,
}

extension LearnigningChapterLengthExtension on LearnigningChapterLength {
  String get value {
    switch (this) {
      case LearnigningChapterLength.short:
        return 'Short';
      case LearnigningChapterLength.medium:
        return 'Medium';
      case LearnigningChapterLength.long:
        return 'Long';
    }
  }
}
