import 'package:flutter/material.dart';
import 'package:lablab2/res/res_extension.dart';

class QuizContent extends StatelessWidget {
  const QuizContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Q4',
          style: context.res.styles.subheading.copyWith(
            color: context.res.colors.black,
          ),
        ),
        Text(
          'Lorem ipsum dolor sit amet consectetur. Egestas tellus laoreet diam nisi. Habitant mollis suspendisse turpis iaculis nascetur elementum metus ac viverra.',
          style: context.res.styles.body.copyWith(
            color: context.res.colors.black,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
