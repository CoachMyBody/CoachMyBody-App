import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/textstyles.dart';

import 'package:flutter/material.dart';

final ThemeData themeData = ThemeData(
  fontFamily: FontFamily.spoqaHanSansNeo,
  brightness: Brightness.light,
  primarySwatch:
      MaterialColor(AppColors.cmb_grey[500].value, AppColors.cmb_grey),
  primaryColor: AppColors.cmb_grey[500],
  primaryColorBrightness: Brightness.light,
  accentColor: AppColors.cmb_grey[500],
  accentColorBrightness: Brightness.light,
  appBarTheme: AppBarTheme(backgroundColor: Colors.white, elevation: 0.0),
  scaffoldBackgroundColor: AppColors.cmb_grey[00],
);

// final ThemeData themeDataDark;
