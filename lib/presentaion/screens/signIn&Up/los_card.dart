import 'package:flutter/material.dart';
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
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: context.res.colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              child: Text(
                'Login',
                style: context.res.styles.buttons.copyWith(
                  color: context.res.colors.white,
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: const Color(0XffE6E6E6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              child: Text(
                'Create an account',
                style: context.res.styles.buttons.copyWith(
                  color: const Color(0XFF6A5AE0),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              child: Text(
                'Later',
                style: context.res.styles.buttons.copyWith(
                  color: const Color(0Xff858494),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
