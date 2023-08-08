import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lablab2/presentaion/shared_widgets/circle.dart';
import 'package:lablab2/res/res_extension.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double topCircleSize = context.res.dimens.screenWidth;
    final double bottomCircleSize = context.res.dimens.screenWidth * 0.5;

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
          // the images
          Positioned(
            top: context.res.dimens.screenHeight * 0.05,
            left: -60,
            child: Transform.rotate(
              angle: -pi / 6,
              child: SvgPicture.asset(
                context.res.drawable.triangle,
              ),
            ),
          ),
          Positioned(
            top: context.res.dimens.screenHeight * 0.2,
            right: -50,
            child: SvgPicture.asset(
              context.res.drawable.ellipse,
              width: 150,
            ),
          ),
          Positioned(
            top: context.res.dimens.screenHeight * 0.7,
            left: 0,
            child: SvgPicture.asset(
              context.res.drawable.star,
              width: 150,
            ),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const FlutterLogo(
                  size: 80,
                ),
                Text.rich(
                  TextSpan(
                    style: context.res.styles.heading,
                    children: [
                      const TextSpan(
                        text: 'Curious',
                      ),
                      TextSpan(
                        text: 'Bud',
                        style: context.res.styles.heading.copyWith(
                          color: context.res.colors.green,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
