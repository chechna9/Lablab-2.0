import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_svg/svg.dart';

import 'package:lablab2/presentaion/shared_widgets/circle.dart';
import 'package:lablab2/res/res_extension.dart';

import '../../shared_widgets/custom_appbar.dart';
import '../../shared_widgets/labled_text_input.dart';
import '../../shared_widgets/text_button.dart';

class ContentDetails extends StatelessWidget {
  const ContentDetails({super.key});

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
                const SizedBox(
                  height: 20,
                ),
                LabledTextInput(
                  label: "Topic",
                  controller: TextEditingController(),
                  validator: (p0) {},
                ),
                const Row(
                  children: [
                    Expanded(
                      child: TextFieldDropMenu(
                        values: ["English", "Arabic", "French"],
                        hintText: "Language",
                        initialValue: "English",
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: TextFieldDropMenu(
                        values: ["Short", "Medium", "Long"],
                        hintText: "Length",
                        initialValue: "Short",
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Expanded(
                      child: TextFieldDropMenu(
                        values: ["Superficial", "Mid-detailed", "Detailed"],
                        hintText: "Depth",
                        initialValue: "Superficial",
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: TextFieldDropMenu(
                        values: [
                          "Astronomy",
                          "Biology",
                          "Chemistry",
                          "Computer Science",
                          "Economics",
                          "History",
                          "Mathematics"
                        ],
                        hintText: "Field",
                        initialValue: "Astronomy",
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Expanded(
                      child: TextFieldDropMenu(
                        values: ["Basic", "Medium", "Advanced"],
                        hintText: "Level",
                        initialValue: "Basic",
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: TextFieldDropMenu(
                        values: [
                          "Short",
                          "Medium",
                          "Long",
                        ],
                        hintText: "Chapter",
                        initialValue: "Short",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                MyTextButton(
                  onPressed: () {},
                  text: "Next",
                  bgColor: context.res.colors.green,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TextFieldDropMenu extends StatefulWidget {
  const TextFieldDropMenu(
      {super.key, this.hintText, required this.values, this.initialValue});
  final String? hintText;
  final List<String> values;
  final String? initialValue;

  @override
  State<TextFieldDropMenu> createState() => _TextFieldDropMenuState();
}

String initial = '';

class _TextFieldDropMenuState extends State<TextFieldDropMenu> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.hintText!,
            style: context.res.styles.body.copyWith(
              color: context.res.colors.white,
            ),
          ),
          SizedBox(
            height: context.res.dimens.labelFieldMargin,
          ),
          InputDecorator(
              isEmpty: false,
              decoration: InputDecoration(
                suffixIcon: PopupMenuButton<String>(
                  icon: const Icon(Icons.arrow_drop_down),
                  onSelected: (String value) {},
                  itemBuilder: (BuildContext context) {
                    return widget.values
                        .map<PopupMenuItem<String>>((String value) {
                      return PopupMenuItem(
                        value: value,
                        child: Text(value),
                        onTap: () {
                          setState(() {
                            initial = value;
                          });
                        },
                      );
                    }).toList();
                  },
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(
                    color: Color(0xffBDBDBD),
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(
                    color: context.res.colors.black,
                    width: 1,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(
                    width: 1,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(
                    color: context.res.colors.red,
                    width: 1,
                  ),
                ),
              ),
              child: Text(
                initial == '' ? widget.initialValue! : initial,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 14),
              )),
        ],
      ),
    );
  }
}
