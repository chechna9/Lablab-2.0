import 'package:flutter/material.dart';
import 'package:lablab2/presentaion/shared_widgets/text_button.dart';
import 'package:lablab2/res/res_extension.dart';

class LoginOrSignUPCard extends StatelessWidget {
  const LoginOrSignUPCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.res.colors.white,
      margin: EdgeInsets.all(context.res.dimens.cardMargin),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Login or Sign Up",
              textAlign: TextAlign.center,
              style: context.res.styles.subheading.copyWith(
                color: context.res.colors.black,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Login or create an account to take quiz, take part in challenge, and more.",
              textAlign: TextAlign.center,
              style: context.res.styles.body.copyWith(
                color: context.res.colors.gray,
              ),
            ),
            const SizedBox(height: 16),
            MyTextButton(
              onPressed: () {},
              text: 'Login',
              textColor: context.res.colors.white,
              bgColor: context.res.colors.purple,
            ),
            const SizedBox(height: 16),
            MyTextButton(
              onPressed: () {},
              text: 'Create an account',
              textColor: const Color(0XFF6A5AE0),
              bgColor: const Color(0XffE6E6E6),
            ),
            const SizedBox(height: 16),
            MyTextButton(
              onPressed: () {},
              text: 'Later',
              textColor: const Color(0Xff858494),
            ),
          ],
        ),
      ),
    );
  }
}
