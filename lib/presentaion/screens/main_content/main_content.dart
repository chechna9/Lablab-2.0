import 'package:flutter/material.dart';

import 'package:lablab2/data/models/chapter%20_model/chapter.dart';
import 'package:lablab2/data/models/content_model/content_model.dart';
import 'package:lablab2/presentaion/screens/main_content/swiper_content.dart';
import 'package:lablab2/presentaion/shared_widgets/circle.dart';
import 'package:lablab2/presentaion/shared_widgets/custom_appbar.dart';
import 'package:lablab2/res/res_extension.dart';

class MainContent extends StatelessWidget {
  const MainContent({super.key}); 

  @override
  Widget build(BuildContext context) {
    final ContentModel content = ContentModel(
      title: 'Content',
      chapters: [
        Chapter(
          chapterTitle: 'Chapter 1',
          content:
              'Lorem ipsum dolor sit amet consectetur. Egestas tellus laoreet diam nisi. Habitant mollis suspendisse turpis iaculis nascetur elementum metus ac viverra. Nec in lorem curabitur pulvinar volutpat. Nunc pulvinar dictumst dignissim imperdiet. Viverra mauris urna pretium vitae vulputate feugiat a dictum. Ipsum duis id fusce fusce augue vestibulum. Ornare risus et praesent cursus. Magna cursus in tellus sagittis. Vel morbi massa montes mi id egestas in nunc.',
          image:
              'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
        ),
        Chapter(
          chapterTitle: 'Chapter 2',
          content:
              'Lorem ipsum dolor sit amet consectetur. Egestas tellus laoreet diam nisi. Habitant mollis suspendisse turpis iaculis nascetur elementum metus ac viverra. Nec in lorem curabitur pulvinar volutpat. Nunc pulvinar dictumst dignissim imperdiet. Viverra mauris urna pretium vitae vulputate feugiat a dictum. Ipsum duis id fusce fusce augue vestibulum. Ornare risus et praesent cursus. Magna cursus in tellus sagittis. Vel morbi massa montes mi id egestas in nunc. Lorem ipsum dolor sit amet consectetur. Egestas tellus laoreet diam nisi. Habitant mollis suspendisse turpis iaculis nascetur elementum metus ac viverra. Nec in lorem curabitur pulvinar volutpat. Nunc pulvinar dictumst dignissim imperdiet. Viverra mauris urna pretium vitae vulputate feugiat a dictum. Ipsum duis id fusce fusce augue vestibulum. Ornare risus et praesent cursus. Magna cursus in tellus sagittis. Vel morbi massa montes mi id egestas in nunc.',
          image:
              'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
        ),
        Chapter(
          chapterTitle: 'Chapter 3',
          content:
              'Lorem ipsum dolor sit amet consectetur. Egestas tellus laoreet diam nisi. Habitant mollis suspendisse turpis iaculis nascetur elementum metus ac viverra. Nec in lorem curabitur pulvinar volutpat. Nunc pulvinar dictumst dignissim imperdiet. Viverra mauris urna pretium vitae vulputate feugiat a dictum. Ipsum duis id fusce fusce augue vestibulum. Ornare risus et praesent cursus. Magna cursus in tellus sagittis. Vel morbi massa montes mi id egestas in nunc.',
          image:
              'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
        ),
        Chapter(
          chapterTitle: 'Chapter 3',
          content:
              'Lorem ipsum dolor sit amet consectetur. Egestas tellus laoreet diam nisi. Habitant mollis suspendisse turpis iaculis nascetur elementum metus ac viverra. Nec in lorem curabitur pulvinar volutpat. Nunc pulvinar dictumst dignissim imperdiet. Viverra mauris urna pretium vitae vulputate feugiat a dictum. Ipsum duis id fusce fusce augue vestibulum. Ornare risus et praesent cursus. Magna cursus in tellus sagittis. Vel morbi massa montes mi id egestas in nunc.',
          image:
              'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
        ),
        Chapter(
          chapterTitle: 'Chapter 3',
          content:
              'Lorem ipsum dolor sit amet consectetur. Egestas tellus laoreet diam nisi. Habitant mollis suspendisse turpis iaculis nascetur elementum metus ac viverra. Nec in lorem curabitur pulvinar volutpat. Nunc pulvinar dictumst dignissim imperdiet. Viverra mauris urna pretium vitae vulputate feugiat a dictum. Ipsum duis id fusce fusce augue vestibulum. Ornare risus et praesent cursus. Magna cursus in tellus sagittis. Vel morbi massa montes mi id egestas in nunc.',
          image:
              'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
        ),
        Chapter(
          chapterTitle: 'Chapter 3',
          content:
              'Lorem ipsum dolor sit amet consectetur. Egestas tellus laoreet diam nisi. Habitant mollis suspendisse turpis iaculis nascetur elementum metus ac viverra. Nec in lorem curabitur pulvinar volutpat. Nunc pulvinar dictumst dignissim imperdiet. Viverra mauris urna pretium vitae vulputate feugiat a dictum. Ipsum duis id fusce fusce augue vestibulum. Ornare risus et praesent cursus. Magna cursus in tellus sagittis. Vel morbi massa montes mi id egestas in nunc.',
          image:
              'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
        ),
        Chapter(
          chapterTitle: 'Chapter 3',
          content:
              'Lorem ipsum dolor sit amet consectetur. Egestas tellus laoreet diam nisi. Habitant mollis suspendisse turpis iaculis nascetur elementum metus ac viverra. Nec in lorem curabitur pulvinar volutpat. Nunc pulvinar dictumst dignissim imperdiet. Viverra mauris urna pretium vitae vulputate feugiat a dictum. Ipsum duis id fusce fusce augue vestibulum. Ornare risus et praesent cursus. Magna cursus in tellus sagittis. Vel morbi massa montes mi id egestas in nunc.',
          image:
              'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
        ),
        Chapter(
          chapterTitle: 'Chapter 3',
          content:
              'Lorem ipsum dolor sit amet consectetur. Egestas tellus laoreet diam nisi. Habitant mollis suspendisse turpis iaculis nascetur elementum metus ac viverra. Nec in lorem curabitur pulvinar volutpat. Nunc pulvinar dictumst dignissim imperdiet. Viverra mauris urna pretium vitae vulputate feugiat a dictum. Ipsum duis id fusce fusce augue vestibulum. Ornare risus et praesent cursus. Magna cursus in tellus sagittis. Vel morbi massa montes mi id egestas in nunc.',
          image:
              'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
        ),
      ],
    );
    final double topCircleSize = context.res.dimens.screenWidth * 0.8;
    final double bottomCircleSize = context.res.dimens.screenWidth * 0.8;
    final List<Widget> backgroundCircles = [
      // top circles
      Positioned(
        top: -topCircleSize / 2,
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
          tag: "bottomCircle",
          child: Circle.sameSize(
            color: context.res.colors.lightPurple,
            strockWidth: 3,
            size: bottomCircleSize,
          ),
        ),
      ),
    ];

    return Material(
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
                  title: content.title,
                  backButtonColor: context.res.colors.black,
                  titleColor: context.res.colors.black,
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: SwiperContent(
                    chapters: content.chapters,
                  ),
                ), // first chapter
              ],
            ),
          )
        ],
      ),
    );
  }
}
