enum Fields {
  astronomy,
  biology,
  chemistry,
  computerScience,
  science,
  economics,
  history,
  mathematics,
}

extension FieldsExtension on Fields {
  String get value {
    switch (this) {
      case Fields.astronomy:
        return 'Astronomy';
      case Fields.biology:
        return 'Biology';
      case Fields.chemistry:
        return 'Chemistry';
      case Fields.computerScience:
        return 'Computer Science';
      case Fields.science:
        return 'Science';
      case Fields.economics:
        return 'Economics';
      case Fields.history:
        return 'History';
      case Fields.mathematics:
        return 'Mathematics';
    }
  }
}
