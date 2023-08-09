import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lablab2/presentaion/screens/signIn&Up/los_card.dart';
import 'package:lablab2/presentaion/shared_widgets/circle.dart';
import 'package:lablab2/res/res_extension.dart';
import 'package:vector_math/vector_math_64.dart';

class SignInUP extends StatefulWidget {
  const SignInUP({super.key});

  @override
  State<SignInUP> createState() => _SignInUPState();
}

class _SignInUPState extends State<SignInUP> {
  double _yOffset = 1;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _yOffset = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final double topCircleSize = context.res.dimens.screenWidth;
    final double bottomCircleSize = context.res.dimens.screenWidth * 0.5;
    final double topOffset = context.res.dimens.screenHeight * 0.1;

    return Material(
      color: context.res.colors.purple,
      child: Stack(
        children: [
          // top circles
          Positioned(
            top: -topCircleSize / 2,
            left: -topCircleSize / 2,
            child: Circle.sameSize(
              color: context.res.colors.lightPurple,
              strockWidth: 3,
              size: topCircleSize,
              children: [
                Circle.sameSize(
                  color: context.res.colors.lightPurple,
                  strockWidth: 2,
                  size: topCircleSize * 0.9,
                ),
              ],
            ),
          ),
          // bottom circles
          Positioned(
            bottom: -bottomCircleSize / 3,
            right: -bottomCircleSize / 3,
            child: Circle.sameSize(
              color: context.res.colors.lightPurple,
              strockWidth: 3,
              size: bottomCircleSize,
              children: [
                Circle.sameSize(
                  color: context.res.colors.lightPurple,
                  strockWidth: 2,
                  size: bottomCircleSize * 0.8,
                ),
                SvgPicture.asset(
                  context.res.drawable.rectangle,
                  width: 50,
                ),
              ],
            ),
          ),
          // the 3 stars in the middle
          Positioned(
            top: topOffset + 40,
            left: context.res.dimens.screenWidth * 0.15,
            child: SvgPicture.asset(
              context.res.drawable.star,
              width: 100,
            ),
          ),

          Positioned(
            top: topOffset + 120,
            left: context.res.dimens.screenWidth * 0.4,
            child: SvgPicture.asset(
              context.res.drawable.star,
              width: 70,
            ),
          ),
          Positioned(
            top: topOffset,
            right: context.res.dimens.screenWidth * 0.1,
            child: SvgPicture.asset(
              context.res.drawable.star,
              width: 150,
            ),
          ),
          AnimatedSlide(
            offset: Offset(0, _yOffset),
            curve: Curves.fastOutSlowIn,
            duration: const Duration(milliseconds: 1000),
            child: const Align(
              alignment: Alignment.bottomCenter,
              child: LoginOrSignUPCard(),
            ),
          ),
        ],
      ),
    );
  }
}
