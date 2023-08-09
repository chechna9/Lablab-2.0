import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lablab2/presentaion/screens/signIn/sign_in_form.dart';
import 'package:lablab2/presentaion/shared_widgets/circle.dart';
import 'package:lablab2/res/res_extension.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignUpState();
}

class _SignUpState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    final double bottomCircleSize = context.res.dimens.screenWidth;
    final double topCircleSize = context.res.dimens.screenWidth * 0.5;
    const double bottomOffset = 20;
    const double rightOffset = 60;
    return Material(
      color: context.res.colors.white,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // top circles
          Positioned(
            top: -topCircleSize * 0.6,
            left: -topCircleSize / 2,
            child: Hero(
              tag: "topCircle",
              child: Circle.sameSize(
                color: context.res.colors.lightPurple,
                strockWidth: 3,
                size: topCircleSize,
              ),
            ),
          ),
          // bottom circles
          Positioned(
            bottom: -bottomCircleSize * 0.7,
            left: -bottomCircleSize * 0.5,
            child: Circle.sameSize(
              color: context.res.colors.lightPurple,
              strockWidth: 3,
              size: bottomCircleSize,
              children: [
                Circle.sameSize(
                  color: context.res.colors.lightPurple,
                  strockWidth: 2,
                  size: bottomCircleSize - 40,
                ),
              ],
            ),
          ),
          // thres bottom right images
          Positioned(
            bottom: bottomOffset,
            right: rightOffset,
            child: SvgPicture.asset(
              context.res.drawable.rectangle,
              width: 40,
            ),
          ),
          Positioned(
            bottom: bottomOffset - 15,
            right: rightOffset,
            child: SvgPicture.asset(
              context.res.drawable.rectangle,
              width: 25,
            ),
          ),
          Positioned(
            bottom: bottomOffset,
            right: rightOffset - 20,
            child: SvgPicture.asset(
              context.res.drawable.rectangle,
              width: 28,
            ),
          ),
          FractionallySizedBox(
            heightFactor: 1,
            child: Padding(
              padding: EdgeInsets.only(
                left: context.res.dimens.contentPadding,
                right: context.res.dimens.contentPadding,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: const SignInForm(),
            ),
          ),
        ],
      ),
    );
  }
}
