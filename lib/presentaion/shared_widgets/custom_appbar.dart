import 'package:flutter/material.dart';
import 'package:lablab2/res/res_extension.dart';

class CustomAppbar extends StatelessWidget {
  final String title;

  final bool showBackButton;
  final Color titleColor;
  final Color backButtonColor;
  const CustomAppbar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.titleColor = Colors.black,
    this.backButtonColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            showBackButton
                ? IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    splashRadius: 20,
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: backButtonColor,
                    ),
                  )
                : Container(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.res.styles.heading.copyWith(
                    color: titleColor,
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
          ],
        ),
        Image.asset(
          context.res.drawable.avatar,
          width: context.res.dimens.avatarRadius,
        ),
      ],
    );
  }
}
