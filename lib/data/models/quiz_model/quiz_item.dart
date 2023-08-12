import 'package:lablab2/data/models/quiz_model/quiz_option.dart';

class QuizItem {
  final String question;
  List<QuizOption> options;

  QuizItem({
    required this.question,
    required this.options,
  });
}
