import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lablab2/bloc/content/content_cubit.dart';
import 'package:lablab2/data/models/content_model/content_model.dart';
import 'package:lablab2/presentaion/screens/main_content/swiper_content.dart';
import 'package:lablab2/presentaion/screens/quiz/quiz_content.dart';
import 'package:lablab2/presentaion/shared_widgets/circle.dart';
import 'package:lablab2/presentaion/shared_widgets/custom_appbar.dart';
import 'package:lablab2/res/res_extension.dart';

class QuizMain extends StatelessWidget {
  final String chapterContent;
  const QuizMain({super.key, required this.chapterContent});

  @override
  Widget build(BuildContext context) {
    final double topCircleSize = context.res.dimens.screenWidth * 0.8;
    final double bottomCircleSize = context.res.dimens.screenWidth * 0.8;
    final List<Widget> backgroundCircles = [
      // top circles
      Positioned(
        top: -topCircleSize * 0.8,
        left: -topCircleSize / 3,
        child: Hero(
          tag: "topCircle",
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
      ),

      // bottom circles
      Positioned(
        bottom: -bottomCircleSize * 0.6,
        left: -bottomCircleSize / 2,
        child: Hero(
          tag: "bottomCircle",
          child: Circle.sameSize(
            color: context.res.colors.lightPurple,
            strockWidth: 3,
            size: bottomCircleSize,
            children: [
              Circle.sameSize(
                color: context.res.colors.lightPurple,
                strockWidth: 2,
                size: bottomCircleSize - 60,
              ),
            ],
          ),
        ),
      ),
      // center right circle
      Positioned(
        // bottom: -bottomCircleSize * 0.6,
        right: -bottomCircleSize * 0.8,
        child: Hero(
          tag: "centerRightCircle",
          child: Circle.sameSize(
            color: context.res.colors.lightPurple,
            strockWidth: 3,
            size: bottomCircleSize,
          ),
        ),
      ),
    ];
    return SafeArea(
      child: Material(
        color: context.res.colors.white,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ...backgroundCircles,
            Padding(
              padding: EdgeInsets.only(
                left: context.res.dimens.mainPadding,
                right: context.res.dimens.mainPadding,
                top: context.res.dimens.topMargin,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomAppbar(
                      title: 'Quiz',
                      backButtonColor: context.res.colors.black,
                      titleColor: context.res.colors.black,
                      onBackButtonPressed: () {}),
                  const SizedBox(
                    height: 20,
                  ),
                  //  quiz content
                  Expanded(
                    child: QuizContent(
                      chapterContent: chapterContent,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
