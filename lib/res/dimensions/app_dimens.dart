import 'package:flutter/material.dart';
import 'package:lablab2/res/dimensions/dimens.dart';

class AppDimensions extends Dimensions {
  final BuildContext context;
  AppDimensions(this.context);

  @override
  double get screenHeight => MediaQuery.of(context).size.height;

  @override
  double get screenWidth => MediaQuery.of(context).size.width;

  @override
  double get cardMargin => 24;

  @override
  double get contentPadding => 40;

  @override
  double get labelFieldMargin => 10;
  @override
  double get mainPadding => 22;

  @override
  double get avatarRadius => 60;
}
