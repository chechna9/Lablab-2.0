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

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _termsAndConditions = false;
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Create an account",
                style: context.res.styles.heading.copyWith(
                  color: context.res.colors.black,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              LabledTextInput(
                label: 'Name',
                controller: _nameController,
                validator: Validators.emailValidator,
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
                children: [
                  Checkbox(
                    value: _termsAndConditions,
                    onChanged: (changed) {
                      setState(() {
                        _termsAndConditions = changed!;
                      });
                    },
                    fillColor: MaterialStateProperty.all(
                      context.res.colors.green,
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'I agree to the ',
                      style: context.res.styles.body.copyWith(
                        color: context.res.colors.gray,
                      ),
                      children: [
                        TextSpan(
                          text: 'Terms',
                          style: context.res.styles.body.copyWith(
                            color: context.res.colors.green,
                          ),
                        ),
                        const TextSpan(
                          text: ' and',
                        ),
                        TextSpan(
                          text: ' Privacy Policy.',
                          style: context.res.styles.body.copyWith(
                            color: context.res.colors.green,
                          ),
                        ),
                      ],
                    ),
                    style: context.res.styles.body.copyWith(
                      color: context.res.colors.gray,
                    ),
                  ),
                ],
              ),
              MyTextButton(
                onPressed: () {
                  if (_termsAndConditions) {
                    DepInj.locator.get<AppRouter>().push(context, Screens.main);
                  }
                },
                text: 'Create an account',
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
                      "Sign up with Google",
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
                    'Already have an account? ',
                    style: context.res.styles.body.copyWith(
                      color: context.res.colors.gray,
                    ),
                  ),
                  MyTextButton(
                    onPressed: () {
                      DepInj.locator
                          .get<AppRouter>()
                          .pushReplacement(context, Screens.signIn);
                    },
                    text: 'Sign In',
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
