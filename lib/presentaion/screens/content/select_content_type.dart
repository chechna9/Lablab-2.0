import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:lablab2/presentaion/shared_widgets/circle.dart';
import 'package:lablab2/presentaion/shared_widgets/text_button.dart';
import 'package:lablab2/res/res_extension.dart';

import '../../shared_widgets/custom_appbar.dart';

class SelectContentType extends StatefulWidget {
  const SelectContentType({super.key});

  @override
  State<SelectContentType> createState() => _SelectContentTypeState();
}

class _SelectContentTypeState extends State<SelectContentType> {
  @override
  Widget build(BuildContext context) {
    final double topCircleSize = context.res.dimens.screenWidth * 0.5;
    final double bottomCircleSize = context.res.dimens.screenWidth * 0.8;
    final double topOffset = context.res.dimens.screenHeight * 0.7;

    final List<Widget> backgroundCircles = [
      // top circles
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
        top: topOffset + 150,
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

      // bottom circles
      // center right circle
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 20,
                ),
                CustomAppbar(
                  title: "New Content",
                  backButtonColor: context.res.colors.white,
                  titleColor: context.res.colors.white,
                ),
                const Spacer(),
                Text(
                  "Lorem ipsum dolor sit amet consectetur. Neque sit vitae nunc mi varius scelerisque turpis.",
                  style: context.res.styles.body,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: Text("Do you want a story or a text book",
                      style: context.res.styles.body
                          .copyWith(fontWeight: FontWeight.bold)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: context.res.colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          "Story",
                          style: context.res.styles.buttons
                              .copyWith(color: context.res.colors.purple),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: context.res.colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          "Text Book",
                          style: context.res.styles.buttons
                              .copyWith(color: context.res.colors.purple),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextButton(
                  onPressed: () {},
                  text: "Next",
                  bgColor: context.res.colors.green,
                ),
                const Spacer(
                  flex: 3,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
