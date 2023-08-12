import 'package:flutter/material.dart';
import 'package:lablab2/data/models/chapter%20_model/chapter.dart';
import 'package:lablab2/data/models/content_model/content_model.dart';
import 'package:lablab2/res/res_extension.dart';

class FieldCard extends StatelessWidget {
  final ContentModel content;
  final void Function()? onSelect;
  const FieldCard({super.key, required this.content, this.onSelect});

  @override
  Widget build(BuildContext context) {
    String subtitle = "";
    for (Chapter chapiter in content.chapters) {
      subtitle += "${chapiter.chapterTitle}, ";
    }

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
                gradient: const LinearGradient(
                  colors: [
                    Color(0Xff46BB6E),
                    Color(0Xff5DFA93),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: context.res.colors.gray,
                    blurRadius: 10,
                    blurStyle: BlurStyle.inner,
                    offset: const Offset(0, 2),
                  ),
                  BoxShadow(
                    color: context.res.colors.gray,
                    blurRadius: 10,
                    blurStyle: BlurStyle.inner,
                    offset: const Offset(0, -2),
                  ),
                  BoxShadow(
                    color: context.res.colors.black.withOpacity(0.5),
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: const Offset(0, 5),
                  ),
                ],
                image: DecorationImage(
                  image: NetworkImage(content.chapters[0].image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    content.title,
                    style: context.res.styles.subheading.copyWith(
                      color: context.res.colors.black,
                    ),
                  ),
                  Text(
                    subtitle,
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
                  onPressed: onSelect,
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
