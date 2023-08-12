// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:lablab2/data/models/quiz_model/quiz_option.dart';

class QuizItem {
  final String question;
  List<QuizOption> options;

  QuizItem({
    required this.question,
    required this.options,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'question': question,
      'options': options.map((x) => x.toMap()).toList(),
    };
  }

  factory QuizItem.fromMap(Map<String, dynamic> map) {
    return QuizItem(
      question: map['question'] as String,
      options: List<QuizOption>.from(
        (map['options'] as List<dynamic>).map<QuizOption>(
          (x) => QuizOption.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizItem.fromJson(String source) =>
      QuizItem.fromMap(json.decode(source) as Map<String, dynamic>);
}
