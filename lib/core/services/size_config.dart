import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizeConfig {
  static late double screenWidth;

  static late double screenHeight;

  static late double textMultiplier;

  static late double imageSizeMultiplier;

  static late double heightMultiplier;

  static late double widthMultiplier;

  static bool isPortrait = true;

  static bool isMobilePortrait = false;

  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      screenWidth = constraints.maxWidth;

      screenHeight = constraints.maxHeight;

      isPortrait = true;

      if (screenWidth < 450) {
        isMobilePortrait = true;
      }
    } else {
      screenWidth = constraints.maxHeight;

      screenHeight = constraints.maxWidth;

      isPortrait = false;

      isMobilePortrait = false;
    }

    textMultiplier = 1.sp;

    imageSizeMultiplier = 1;

    heightMultiplier = 1.h;

    widthMultiplier = 1.w;
  }
}
