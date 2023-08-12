import 'package:flutter/material.dart';

import 'package:just_audio/just_audio.dart';

import 'package:lablab2/data/models/chapter%20_model/chapter.dart';
import 'package:lablab2/presentaion/screens/quiz/quiz_main.dart';
import 'package:lablab2/res/res_extension.dart';

class ContentHero extends StatelessWidget {
  final Chapter chapter;
  const ContentHero({super.key, required this.chapter});

  @override
  Widget build(BuildContext context) {
    final player = AudioPlayer();
    player.setUrl(chapter.audio.toString());

    return Column(
      children: [
        Container(
          // width: context.res.dimens.screenWidth / 4,
          height: context.res.dimens.screenWidth / 2,
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
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
              image: NetworkImage(chapter.image),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => QuizMain(
                              chapterContent: chapter.content,
                            ),
                          ),
                        );
                      },
                      splashRadius: 20,
                      icon: Icon(
                        Icons.question_mark_rounded,
                        color: context.res.colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      splashRadius: 20,
                      iconSize: 30,
                      icon: Icon(
                        Icons.add_outlined,
                        color: context.res.colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        try {
                          if (player.playing) {
                            player.stop();
                            return;
                          }
                          player.play();
                          return;
                        } catch (e) {
                          print(e);
                        }
                      },
                      splashRadius: 20,
                      icon: Icon(
                        Icons.volume_up,
                        color: context.res.colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text(
          chapter.chapterTitle,
          maxLines: 2,
          style: context.res.styles.subheading.copyWith(
            color: context.res.colors.black,
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: SingleChildScrollView(
            child: Text(
              chapter.content,
              style: context.res.styles.body.copyWith(
                color: context.res.colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
