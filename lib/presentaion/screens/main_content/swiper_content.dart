import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:lablab2/data/models/chapter%20_model/chapter.dart';
import 'package:lablab2/presentaion/screens/main_content/content_hero.dart';
import 'package:lablab2/res/res_extension.dart';

class SwiperContent extends StatelessWidget {
  final List<Chapter> chapters;
  const SwiperContent({super.key, required this.chapters});

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemCount: chapters.length,
      pagination: SwiperPagination(
        alignment: Alignment.bottomCenter,
        builder: DotSwiperPaginationBuilder(
          activeColor: context.res.colors.red,
          activeSize: 15,
          size: 10,
          color: context.res.colors.purple,
        ),
      ),
      itemBuilder: (context, index) => ContentHero(
        chapter: chapters[index],
      ),
    );
  }
}
