import 'package:flutter/material.dart';
import 'package:lablab2/res/res_extension.dart';

class LabledTextInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const LabledTextInput({
    super.key,
    required this.label,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.res.styles.body.copyWith(
            color: context.res.colors.gray,
          ),
        ),
        SizedBox(
          height: context.res.dimens.labelFieldMargin,
        ),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          validator: validator,
          style: context.res.styles.body.copyWith(
            color: context.res.colors.black,
          ),
          cursorColor: context.res.colors.black,
          cursorWidth: 1,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            filled: true,
            fillColor: const Color(0XffFDFDFD),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(
                color: Color(0xffBDBDBD),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(
                color: context.res.colors.black,
                width: 1,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(
                width: 1,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(
                color: context.res.colors.red,
                width: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
