import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lablab2/bloc/content/content_cubit.dart';
import 'package:lablab2/data/models/content_model/content_model.dart';
import 'package:lablab2/dep_inj.dart';
import 'package:lablab2/presentaion/screens/main/field_card.dart';
import 'package:lablab2/presentaion/screens/quiz/quiz_main.dart';
import 'package:lablab2/presentaion/shared_widgets/circle.dart';
import 'package:lablab2/presentaion/shared_widgets/custom_appbar.dart';
import 'package:lablab2/presentaion/shared_widgets/search_input.dart';
import 'package:lablab2/res/res_extension.dart';
import 'package:lablab2/routes/app_router.dart';
import 'package:lablab2/routes/screens_enum.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ContentCubit>().getContent();
  }

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
                CustomAppbar(
                  title: 'My Content',
                  titleColor: context.res.colors.white,
                  showBackButton: false,
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
                  child: BlocBuilder<ContentCubit, ContentState>(
                    builder: (context, state) {
                      if (state is ContentLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is ContentError) {
                        return const Center(
                          child: Text("Error"),
                        );
                      }
                      if (state is ContentLoaded && state.listContent.isEmpty) {
                        return const Center(
                          child: Text("No content"),
                        );
                      }
                      if (state is ContentLoaded) {
                        return Container(
                          decoration: BoxDecoration(
                            color: context.res.colors.lightPurple,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: state.listContent.length,
                            itemBuilder: (context, index) {
                              ContentModel content = state.listContent[index];
                              return FieldCard(
                                content: content,
                                onSelect: () {
                                  context.read<ContentCubit>().selectContent(
                                      state.listContent, content);
                                  DepInj.locator
                                      .get<AppRouter>()
                                      .push(context, Screens.mainContent);
                                },
                                onDelete: () {
                                  context
                                      .read<ContentCubit>()
                                      .deleteContent(content);
                                },
                              );
                            },
                          ),
                        );
                      }
                      return const SizedBox();
                    },
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizMain(),
                          ),
                        );
                      },
                      icon: const Icon(
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
