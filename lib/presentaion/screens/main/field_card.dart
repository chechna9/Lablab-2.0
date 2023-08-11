import 'package:flutter/material.dart';
import 'package:lablab2/res/res_extension.dart';

class FieldCard extends StatelessWidget {
  const FieldCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.res.colors.white,
      margin: EdgeInsets.symmetric(
        horizontal: context.res.dimens.cardMargin,
        vertical: context.res.dimens.cardMargin / 4,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.only(
          left: context.res.dimens.mainPadding / 2,
          top: context.res.dimens.mainPadding / 2,
          bottom: context.res.dimens.mainPadding / 2,
        ),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: context.res.colors.green,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: context.res.colors.black,
                    blurRadius: 10,
                    blurStyle: BlurStyle.inner,
                    offset: const Offset(0, 5),
                  ),
                  BoxShadow(
                    color: context.res.colors.black,
                    blurRadius: 10,
                    blurStyle: BlurStyle.inner,
                    offset: const Offset(0, -5),
                  ),
                  BoxShadow(
                    color: context.res.colors.gray,
                    blurRadius: 1,
                    blurStyle: BlurStyle.outer,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'What is AI?',
                    style: context.res.styles.subheading.copyWith(
                      color: context.res.colors.black,
                    ),
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet consectetur. Neque sit vitae nunc mi varius scelerisque turpis..',
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: context.res.styles.superSmall.copyWith(
                      color: context.res.colors.gray,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 5),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  splashRadius: 15,
                  iconSize: 20,
                  icon: Icon(
                    Icons.delete,
                    color: context.res.colors.red,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  splashRadius: 15,
                  iconSize: 20,
                  icon: Icon(
                    Icons.keyboard_arrow_right_outlined,
                    color: context.res.colors.purple,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
