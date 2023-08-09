import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lablab2/dep_inj.dart';
import 'package:lablab2/presentaion/shared_widgets/circle.dart';
import 'package:lablab2/res/res_extension.dart';
import 'package:lablab2/routes/app_router.dart';
import 'package:lablab2/routes/screens_enum.dart';
import 'package:vector_math/vector_math_64.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation<Offset> __curiousSlideAnimation;
  late Animation<double> __curiousFadeAnimation;
  late Animation<Offset> __budSlideAnimation;
  late Animation<double> __budFadeAnimation;
  late Animation<double> __logoScaleAnimation;
  late Animation<double> _firstImagesPulseAnimation;
  late Animation<double> _secondImagesPulseAnimation;
  late Animation<double> _thirdImagesPulseAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<double> _xSlideAnimation;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    __curiousSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 50),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0,
          0.3,
          curve: Curves.elasticOut,
        ),
      ),
    );
    __curiousFadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0,
          0.3,
          curve: Curves.easeInOut,
        ),
      ),
    );

    __budSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 100),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0,
          0.3,
          curve: Curves.easeInOut,
        ),
      ),
    );

    __budFadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0,
          0.3,
          curve: Curves.easeInOut,
        ),
      ),
    );

    __logoScaleAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.3,
          0.8,
          curve: Curves.elasticOut,
        ),
      ),
    );

    _firstImagesPulseAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.6,
          0.9,
          curve: Curves.elasticOut,
        ),
      ),
    );
    _secondImagesPulseAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.7,
          1,
          curve: Curves.elasticOut,
        ),
      ),
    );

    _thirdImagesPulseAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.8,
          1,
          curve: Curves.elasticOut,
        ),
      ),
    );

    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 2 * pi,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.8,
          1,
          curve: Curves.easeInOut,
        ),
      ),
    );

    _xSlideAnimation = Tween<double>(
      begin: -100,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.8,
          1,
          curve: Curves.easeInOut,
        ),
      ),
    );
    _animationController.forward().then((value) =>
        DepInj.locator<AppRouter>().pushReplacement(context, Screens.los));
  }

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
                  size: topCircleSize - 40,
                ),
              ],
            ),
          ),

          // bottom circles
          Positioned(
            bottom: -bottomCircleSize / 3,
            right: -bottomCircleSize / 3,
            child: AnimatedBuilder(
                animation: Listenable.merge([
                  _xSlideAnimation,
                  _rotationAnimation,
                ]),
                builder: (context, child) {
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..translate(Vector3(_xSlideAnimation.value, 0, 0))
                      ..rotateZ(_rotationAnimation.value),
                    child: Circle.sameSize(
                      color: context.res.colors.lightPurple,
                      strockWidth: 3,
                      size: bottomCircleSize,
                      children: [
                        Circle.sameSize(
                          color: context.res.colors.lightPurple,
                          strockWidth: 2,
                          size: bottomCircleSize - 30,
                        ),
                        SvgPicture.asset(
                          context.res.drawable.rectangle,
                          width: 50,
                        ),
                      ],
                    ),
                  );
                }),
          ),
          // the images
          Positioned(
            top: context.res.dimens.screenHeight * 0.05,
            left: -60,
            child: ScaleTransition(
              scale: _firstImagesPulseAnimation,
              child: Transform.rotate(
                angle: -pi / 6,
                child: SvgPicture.asset(
                  context.res.drawable.triangle,
                ),
              ),
            ),
          ),
          Positioned(
            top: context.res.dimens.screenHeight * 0.2,
            right: -50,
            child: ScaleTransition(
              scale: _secondImagesPulseAnimation,
              child: SvgPicture.asset(
                context.res.drawable.ellipse,
                width: 150,
              ),
            ),
          ),
          Positioned(
            top: context.res.dimens.screenHeight * 0.7,
            left: 0,
            child: ScaleTransition(
              scale: _thirdImagesPulseAnimation,
              child: SvgPicture.asset(
                context.res.drawable.star,
                width: 150,
              ),
            ),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScaleTransition(
                  scale: __logoScaleAnimation,
                  child: const FlutterLogo(
                    size: 80,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FadeTransition(
                      opacity: __curiousFadeAnimation,
                      child: SlideTransition(
                        position: __curiousSlideAnimation,
                        child: Text(
                          'Curious',
                          style: context.res.styles.heading,
                        ),
                      ),
                    ),
                    FadeTransition(
                      opacity: __budFadeAnimation,
                      child: SlideTransition(
                        position: __budSlideAnimation,
                        child: Text(
                          'Bud',
                          style: context.res.styles.heading.copyWith(
                            color: context.res.colors.green,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
