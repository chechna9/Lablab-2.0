import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lablab2/presentaion/screens/main/field_card.dart';
import 'package:lablab2/presentaion/shared_widgets/circle.dart';
import 'package:lablab2/presentaion/shared_widgets/search_input.dart';
import 'package:lablab2/res/res_extension.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double topCircleSize = context.res.dimens.screenWidth * 0.8;
    final double bottomCircleSize = context.res.dimens.screenWidth * 0.8;
    final List<Widget> backgroundCircles = [
      // top circles
      Positioned(
        top: -topCircleSize / 3,
        left: -topCircleSize / 3,
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
        bottom: -bottomCircleSize * 0.6,
        // left: -bottomCircleSize / 2,
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
    ];

    return Material(
      color: context.res.colors.purple,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ...backgroundCircles,
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.res.dimens.mainPadding,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'My content',
                          style: context.res.styles.heading.copyWith(
                            color: context.res.colors.white,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'Woah 3 days streak !',
                              style: context.res.styles.body.copyWith(
                                color: context.res.colors.gold,
                              ),
                            ),
                            Image.asset(
                              context.res.drawable.goldenStar,
                              width: 25,
                            )
                          ],
                        ),
                      ],
                    ),
                    Image.asset(
                      context.res.drawable.avatar,
                      width: context.res.dimens.avatarRadius,
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: SearchInput(),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Lorem ipsum dolor sit amet consectetur. Neque sit vitae nunc mi varius scelerisque turpis.",
                  style: context.res.styles.body,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  child: Column(
                    children: [
                      FieldCard(),
                      FieldCard(),
                      FieldCard(),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
