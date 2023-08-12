// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class QuizGenerationParams {
  int age;
  String chapterContent;
  int optionNumber;

  QuizGenerationParams({
    required this.age,
    required this.chapterContent,
    this.optionNumber = 4,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'age': age,
      'chapterContent': chapterContent,
      'optionNumber': optionNumber,
    };
  }

  factory QuizGenerationParams.fromMap(Map<String, dynamic> map) {
    return QuizGenerationParams(
      age: map['age'] as int,
      chapterContent: map['chapterContent'] as String,
      optionNumber: map['optionNumber'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizGenerationParams.fromJson(String source) =>
      QuizGenerationParams.fromMap(json.decode(source) as Map<String, dynamic>);
}
