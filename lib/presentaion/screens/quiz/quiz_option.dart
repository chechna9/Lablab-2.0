import 'package:flutter/material.dart';
import 'package:lablab2/data/models/quiz_model/quiz_option.dart';
import 'package:lablab2/res/res_extension.dart';

class QuizOPtionCard extends StatefulWidget {
  final QuizOption option;
  const QuizOPtionCard({super.key, required this.option});

  @override
  State<QuizOPtionCard> createState() => _QuizOPtionCardState();
}

class _QuizOPtionCardState extends State<QuizOPtionCard> {
  late Color _color;

  @override
  void initState() {
    _color = context.res.colors.purple;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _color = widget.option.isCorrect
              ? context.res.colors.green
              : context.res.colors.red;
        });
        if (widget.option.isCorrect) {
          Navigator.of(context).pop();
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: _color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: context.res.colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Text(
          widget.option.option,
          style: context.res.styles.body.copyWith(
            color: context.res.colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
