import 'package:flutter/material.dart';
import 'package:lablab2/res/dimensions/dimens.dart';

class AppDimensions extends Dimensions {
  final BuildContext context;
  AppDimensions(this.context);

  @override
  double get screenHeight => MediaQuery.of(context).size.height;

  @override
  double get screenWidth => MediaQuery.of(context).size.width;
}
