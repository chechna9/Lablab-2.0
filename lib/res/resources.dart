import 'package:flutter/material.dart';
import 'package:lablab2/res/colors/app_colors.dart';
import 'package:lablab2/res/colors/base_colors.dart';
import 'package:lablab2/res/dimensions/app_dimens.dart';
import 'package:lablab2/res/dimensions/dimens.dart';
import 'package:lablab2/res/drawable/app_drawable.dart';
import 'package:lablab2/res/drawable/drawable.dart';
import 'package:lablab2/res/styles/text_styles.dart';

class Resources {
  BuildContext context;
  Resources(this.context);
  BaseColors get colors => AppColors();
  Drawable get drawable => AppDrawable();
  AppStyles get styles => AppStyles();
  Dimensions get dimens => AppDimensions(context);
}
