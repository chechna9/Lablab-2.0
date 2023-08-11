enum Genre {
  drama,
  comedy,
  romance,
  action,
  mystery,
  fantasy,
  sciFi,
  historical,
}

extension GenreExtension on Genre {
  String get value {
    switch (this) {
      case Genre.drama:
        return 'Drama';
      case Genre.comedy:
        return 'Comedy';
      case Genre.romance:
        return 'Romance';
      case Genre.action:
        return 'Action';
      case Genre.mystery:
        return 'Mystery';
      case Genre.fantasy:
        return 'Fantasy';
      case Genre.sciFi:
        return 'Sci-Fi';
      case Genre.historical:
        return 'Historical';
    }
  }
}
