import 'package:flutter/material.dart';
import 'package:lablab2/res/res_extension.dart';

class PasswordField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const PasswordField({
    super.key,
    required this.label,
    required this.controller,
    this.validator,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: context.res.styles.body.copyWith(
            color: context.res.colors.gray,
          ),
        ),
        SizedBox(
          height: context.res.dimens.labelFieldMargin,
        ),
        TextFormField(
          obscureText: _isObscure,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: widget.controller,
          validator: widget.validator,
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
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              },
              icon: Icon(
                _isObscure ? Icons.visibility : Icons.visibility_off,
                color: context.res.colors.gray,
              ),
            ),
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
