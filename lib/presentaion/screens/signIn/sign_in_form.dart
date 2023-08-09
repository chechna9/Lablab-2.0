import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lablab2/dep_inj.dart';
import 'package:lablab2/presentaion/shared_widgets/labled_text_input.dart';
import 'package:lablab2/presentaion/shared_widgets/password_field.dart';
import 'package:lablab2/presentaion/shared_widgets/text_button.dart';
import 'package:lablab2/res/res_extension.dart';
import 'package:lablab2/routes/app_router.dart';
import 'package:lablab2/routes/screens_enum.dart';
import 'package:lablab2/utils/validators.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Sign In",
                style: context.res.styles.heading.copyWith(
                  color: context.res.colors.black,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: context.res.dimens.labelFieldMargin,
              ),
              LabledTextInput(
                label: 'Email',
                controller: _emailController,
                validator: Validators.emailValidator,
              ),
              SizedBox(
                height: context.res.dimens.labelFieldMargin,
              ),
              PasswordField(
                label: 'Password',
                controller: _passwordController,
                validator: Validators.passwordValidator,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Forgot your password? ',
                    style: context.res.styles.body.copyWith(
                      color: context.res.colors.gray,
                    ),
                  ),
                  MyTextButton(
                    onPressed: () {},
                    text: 'Click here',
                    textColor: context.res.colors.green,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              MyTextButton(
                onPressed: () {},
                text: 'Sign In',
                bgColor: context.res.colors.purple,
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextButton(
                onPressed: () {},
                bgColor: context.res.colors.green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sign in with Google",
                      style: context.res.styles.buttons.copyWith(
                        color: context.res.colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(
                      context.res.drawable.googleWhiteLogo,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account? ',
                    style: context.res.styles.body.copyWith(
                      color: context.res.colors.gray,
                    ),
                  ),
                  MyTextButton(
                    onPressed: () {
                      DepInj.locator
                          .get<AppRouter>()
                          .pushReplacement(context, Screens.signUp);
                    },
                    text: 'Sign Up',
                    textColor: context.res.colors.green,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
