import 'package:flutter/material.dart';
import 'package:lablab2/res/res_extension.dart';

class MyTextButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final Color? bgColor;
  final Color? textColor;
  const MyTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.bgColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      child: Text(
        text,
        style: context.res.styles.buttons.copyWith(
          color: textColor,
        ),
      ),
    );
  }
}
