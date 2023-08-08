import 'package:lablab2/res/colors/app_colors.dart';
import 'package:lablab2/res/colors/base_colors.dart';
import 'package:lablab2/res/drawable/app_drawable.dart';
import 'package:lablab2/res/drawable/drawable.dart';
import 'package:lablab2/res/styles/text_styles.dart';

class Resources {
  BaseColors get colors => AppColors();
  Drawable get drawable => AppDrawable();
  AppStyles get styles => AppStyles();

  Resources();
}
