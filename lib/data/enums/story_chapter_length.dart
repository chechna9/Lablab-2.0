enum StoryChapterLength {
  short,
  medium,
  long,
}

extension StoryChapterLengthExtension on StoryChapterLength {
  String get value {
    switch (this) {
      case StoryChapterLength.short:
        return 'Short';
      case StoryChapterLength.medium:
        return 'Medium';
      case StoryChapterLength.long:
        return 'Long';
    }
  }
}
