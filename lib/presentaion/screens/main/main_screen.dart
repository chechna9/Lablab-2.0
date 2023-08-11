import 'package:flutter/material.dart';
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
        // left: -bottomCircleSize / 2,
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
    ];

    return Material(
      color: context.res.colors.purple,
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
                const SizedBox(
                  height: 20,
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
                Expanded(
                  child: Container(
                    // clipBehavior: Clip.hardEdge,

                    decoration: BoxDecoration(
                      color: context.res.colors.lightPurple,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: const [
                        FieldCard(),
                        FieldCard(),
                        FieldCard(),
                        FieldCard()
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) => LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        context.res.colors.white,
                        context.res.colors.gray,
                      ],
                    ).createShader(bounds),
                    child: IconButton(
                      iconSize: 60,
                      splashRadius: 35,
                      onPressed: () {},
                      icon: Icon(
                        Icons.add_circle_rounded,
                      ),
                    ),
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
