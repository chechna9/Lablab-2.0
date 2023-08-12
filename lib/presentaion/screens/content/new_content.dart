import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:lablab2/bloc/cubit/newform_cubit.dart';
import 'package:lablab2/presentaion/screens/content/content_desc.dart';
import 'package:lablab2/presentaion/shared_widgets/circle.dart';
import 'package:lablab2/res/res_extension.dart';

import '../../../data/enums/moral.dart';
import '../../shared_widgets/custom_appbar.dart';
import '../../shared_widgets/text_button.dart';

class SelectMoralScreen extends StatefulWidget {
  const SelectMoralScreen({super.key});

  @override
  State<SelectMoralScreen> createState() => _SelectMoralScreenState();
}

extension on String {
  String get capitlaze {
    return this[0].toUpperCase() + this.substring(1);
  }
}

class _SelectMoralScreenState extends State<SelectMoralScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> selectedMoral = context.watch<NewformCubit>().morals;

    final list = List.generate(
      20,
      (index) {
        return ChoiceChip(
          selected: selectedMoral
              .contains(Moral.values[index].toString().split(".")[1].capitlaze),
          onSelected: (value) {
            setState(() {
              selectedMoral.contains(
                      Moral.values[index].toString().split(".")[1].capitlaze)
                  ? context.read<NewformCubit>().removeMorals(
                      Moral.values[index].toString().split(".")[1].capitlaze)
                  : context.read<NewformCubit>().addMorals(
                      Moral.values[index].toString().split(".")[1].capitlaze);
            });
          },
          selectedColor: context.res.colors.lightPurple,
          showCheckmark: false,
          label: Text(
            Moral.values[index].toString().split(".")[1].capitlaze,
            style: context.res.styles.buttons.copyWith(
                color: selectedMoral.contains(
                        Moral.values[index].toString().split(".")[1].capitlaze)
                    ? context.res.colors.white
                    : context.res.colors.purple,
                fontSize: 12),
          ),
          backgroundColor: context.res.colors.white,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        );
      },
    );

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
                  "Select the moral values that this content will teach",
                  style: context.res.styles.body,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 50,
                ),
                Wrap(
                  children: list,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextButton(
                  onPressed: () {
                    if (list.isNotEmpty) {
                      context.read<NewformCubit>().submit();
                    }
                  },
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
