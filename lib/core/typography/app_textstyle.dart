import 'package:flutter/material.dart';
import 'package:test_media/core/constants/color_constants.dart';
import 'package:test_media/core/extension/size_extension.dart';

class AppTextStyle {
  static TextStyle get r8 => TextStyle(
        fontSize: 8.textMultiplier,
        fontFamily: 'SFUIDISPLAY',
        fontWeight: FontWeight.w400,
      );
  static TextStyle get r10 => TextStyle(
        fontSize: 10.textMultiplier,
        fontFamily: 'SFUIDISPLAY',
        fontWeight: FontWeight.w400,
      );
  static TextStyle get r12 => TextStyle(
        fontSize: 12.textMultiplier,
        fontFamily: 'SFUIDISPLAY',
        fontWeight: FontWeight.w400,
      );
  static TextStyle get r14 => TextStyle(
        fontSize: 14.textMultiplier,
        fontFamily: 'SFUIDISPLAY',
        fontWeight: FontWeight.w400,
      );
  static TextStyle get r16 => TextStyle(
        fontSize: 16.textMultiplier,
        fontFamily: 'SFUIDISPLAY',
        fontWeight: FontWeight.w400,
      );
  static TextStyle get r18 => TextStyle(
        fontSize: 18.textMultiplier,
        fontFamily: 'SFUIDISPLAY',
        fontWeight: FontWeight.w400,
      );
  static TextStyle get r20 => TextStyle(
        fontSize: 20.textMultiplier,
        fontFamily: 'SFUIDISPLAY',
        fontWeight: FontWeight.w400,
      );
  static TextStyle get r22 => TextStyle(
        fontSize: 22.textMultiplier,
        fontFamily: 'SFUIDISPLAY',
        fontWeight: FontWeight.w400,
      );
  static TextStyle get r24 => TextStyle(
        fontSize: 24.textMultiplier,
        fontFamily: 'SFUIDISPLAY',
        fontWeight: FontWeight.w400,
      );
  static TextStyle get b8 => r8.copyWith(fontWeight: FontWeight.bold);
  static TextStyle get b10 => r10.copyWith(fontWeight: FontWeight.bold);
  static TextStyle get b12 => r12.copyWith(fontWeight: FontWeight.bold);
  static TextStyle get b14 => r14.copyWith(fontWeight: FontWeight.bold);
  static TextStyle get b16 => r16.copyWith(fontWeight: FontWeight.bold);
  static TextStyle get b18 => r18.copyWith(fontWeight: FontWeight.bold);
  static TextStyle get b20 => r20.copyWith(fontWeight: FontWeight.bold);
  static TextStyle get b22 => r22.copyWith(fontWeight: FontWeight.bold);
  static TextStyle get b24 => r24.copyWith(fontWeight: FontWeight.bold);

  static TextStyle get msb8 => r8.copyWith(fontWeight: FontWeight.w700);
  static TextStyle get msb10 => r10.copyWith(fontWeight: FontWeight.w700);
  static TextStyle get msb12 => r12.copyWith(fontWeight: FontWeight.w700);
  static TextStyle get msb14 => r14.copyWith(fontWeight: FontWeight.w700);
  static TextStyle get msb16 => r16.copyWith(fontWeight: FontWeight.w700);
  static TextStyle get msb18 => r18.copyWith(fontWeight: FontWeight.w700);
  static TextStyle get msb20 => r20.copyWith(fontWeight: FontWeight.w700);
  static TextStyle get msb22 => r22.copyWith(fontWeight: FontWeight.w700);
  static TextStyle get msb24 => r24.copyWith(fontWeight: FontWeight.w700);

  static TextStyle get sb8 => r8.copyWith(fontWeight: FontWeight.w600);
  static TextStyle get sb10 => r10.copyWith(fontWeight: FontWeight.w600);
  static TextStyle get sb12 => r12.copyWith(fontWeight: FontWeight.w600);
  static TextStyle get sb14 => r14.copyWith(fontWeight: FontWeight.w600);
  static TextStyle get sb16 => r16.copyWith(fontWeight: FontWeight.w600);
  static TextStyle get sb18 => r18.copyWith(fontWeight: FontWeight.w600);
  static TextStyle get sb20 => r20.copyWith(fontWeight: FontWeight.w600);
  static TextStyle get sb22 => r22.copyWith(fontWeight: FontWeight.w600);
  static TextStyle get sb24 => r24.copyWith(fontWeight: FontWeight.w600);

  static TextStyle get med8 => r8.copyWith(fontWeight: FontWeight.w500);
  static TextStyle get med10 => r10.copyWith(fontWeight: FontWeight.w500);
  static TextStyle get med12 => r12.copyWith(fontWeight: FontWeight.w500);
  static TextStyle get med14 => r14.copyWith(fontWeight: FontWeight.w500);
  static TextStyle get med16 => r16.copyWith(fontWeight: FontWeight.w500);
  static TextStyle get med18 => r18.copyWith(fontWeight: FontWeight.w500);
  static TextStyle get med20 => r20.copyWith(fontWeight: FontWeight.w500);
  static TextStyle get med22 => r22.copyWith(fontWeight: FontWeight.w500);
  static TextStyle get med24 => r24.copyWith(fontWeight: FontWeight.w500);
}

extension ColorTextStyle on TextStyle {
  TextStyle get white => copyWith(color: ColorConstants.white);
   TextStyle get grey => copyWith(color: ColorConstants.grey);

  TextStyle get black => copyWith(color: ColorConstants.darkBlack);
}
