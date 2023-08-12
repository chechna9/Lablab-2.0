// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class QuizOption {
  final String option;
  final bool isCorrect;

  QuizOption({required this.option, required this.isCorrect});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'option': option,
      'is_correct': isCorrect,
    };
  }

  factory QuizOption.fromMap(Map<String, dynamic> map) {
    return QuizOption(
      option: map['option'] as String,
      isCorrect: map['is_correct'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizOption.fromJson(String source) =>
      QuizOption.fromMap(json.decode(source) as Map<String, dynamic>);
}
