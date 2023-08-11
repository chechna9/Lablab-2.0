enum Languages {
  english,
  french,
  arabic,
}

extension LanguagesExtension on Languages {
  String get value {
    switch (this) {
      case Languages.english:
        return 'English';
      case Languages.french:
        return 'French';
      case Languages.arabic:
        return 'Arabic';
    }
  }
}
