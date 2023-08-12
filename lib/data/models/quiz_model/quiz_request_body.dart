import 'package:lablab2/data/models/quiz_model/quiz_generation_params.dart';

class QuizRequestBody {
  final QuizGenerationParams params;
  bool loadLocal;
  bool saveLoca;

  QuizRequestBody({
    required this.params,
    this.loadLocal = true,
    this.saveLoca = false,
  });
}
