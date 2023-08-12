import 'package:flutter/material.dart';
import 'package:lablab2/data/models/quiz_model/quiz_item.dart';
import 'package:lablab2/data/models/quiz_model/quiz_option.dart';
import 'package:lablab2/presentaion/screens/quiz/quiz_option.dart';
import 'package:lablab2/res/res_extension.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class QuizContent extends StatefulWidget {
  final String chapterContent;
  const QuizContent({super.key, required this.chapterContent});

  @override
  State<QuizContent> createState() => _QuizContentState();
}

class _QuizContentState extends State<QuizContent> {
  late QuizItem quiz;

  late bool _isLoading;
  @override
  void initState() {
    super.initState();
    handleFetch();
  }

  void handleFetch() async {
    setState(() {
      _isLoading = true;
    });
    await fetchData();
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> fetchData() async {
    final Map<String, dynamic> requestBody = {
      "generation_params": {
        "age": 10,
        "chapter_content": widget.chapterContent,
        "quiz_options_number": 4
      },
      "load_local": true,
      "save_local": false
    };
    final response = await http.post(
      Uri.parse('https://kurio-generation-api.up.railway.app/quiz-item'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(requestBody),
    );
    quiz = QuizItem.fromJson(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                quiz.question,
                style: context.res.styles.subheading.copyWith(
                  color: context.res.colors.black,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: quiz.options.length,
                  itemBuilder: (context, index) {
                    QuizOption option = quiz.options[index];
                    return QuizOPtionCard(
                      option: option,
                    );
                  },
                ),
              ),
            ],
          );
  }
}
