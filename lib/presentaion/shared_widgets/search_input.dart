import 'package:flutter/material.dart';
import 'package:lablab2/res/res_extension.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: context.res.colors.black,
      style: context.res.styles.body.copyWith(
        color: context.res.colors.black,
      ),
      decoration: InputDecoration(
        hintText: 'Search for an old content',
        hintStyle: context.res.styles.body.copyWith(
          color: context.res.colors.gray,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        prefixIcon: Icon(
          Icons.search,
          size: 25,
          color: context.res.colors.gray,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: context.res.colors.white,
      ),
    );
  }
}
