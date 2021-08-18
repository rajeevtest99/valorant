import 'package:flutter/material.dart';
import 'size_config.dart';

class AppTheme {
  AppTheme._();

  static const Color waterMelon = Color(0xfffa4454);
  static const Color jasper = Color(0xffdc3d4b);
  static const Color burnham = Color(0xff042e27);
  static const Color museli = Color(0xffb78460);
  static const Color brandyRose = Color(0xffb38c8f);
  static const Color rhino = Color(0xff364966);
  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xff000000);

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppTheme.rhino,
    brightness: Brightness.light,
    fontFamily: "Coolvetica",
  );

  static final EdgeInsetsGeometry screenPadding = EdgeInsets.symmetric(
      horizontal: 2.5 * SizeConfig.heightMultiplier,
      vertical: 2.5 * SizeConfig.widthMultiplier);

  static final BorderRadius borderRadius = BorderRadius.all(
    Radius.circular(4 * SizeConfig.heightMultiplier),
  );

  static final BorderRadius borderRadius2 = BorderRadius.all(
    Radius.circular(1.5 * SizeConfig.heightMultiplier),
  );
}
