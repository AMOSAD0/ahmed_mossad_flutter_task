import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  AppTextStyles._();

  // ==================== Display Styles ====================

  static TextStyle displayLarge({Color? color}) => GoogleFonts.tajawal(
    fontSize: 57.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.25,
    height: 1.12,
    color: color,
  );

  static TextStyle displayMedium({Color? color}) => GoogleFonts.tajawal(
    fontSize: 45.sp,
    fontWeight: FontWeight.w400,
    height: 1.16,
    color: color,
  );

  static TextStyle displaySmall({Color? color}) => GoogleFonts.tajawal(
    fontSize: 36.sp,
    fontWeight: FontWeight.w400,
    height: 1.22,
    color: color,
  );

  // ==================== Headline Styles ====================

  static TextStyle headlineLarge({Color? color}) => GoogleFonts.tajawal(
    fontSize: 32.sp,
    fontWeight: FontWeight.w600,
    height: 1.25,
    color: color,
  );

  static TextStyle headlineMedium({Color? color}) => GoogleFonts.tajawal(
    fontSize: 28.sp,
    fontWeight: FontWeight.w600,
    height: 1.29,
    color: color,
  );

  static TextStyle headlineSmall({Color? color}) => GoogleFonts.tajawal(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    height: 1.33,
    color: color,
  );

  // ==================== Title Styles ====================

  static TextStyle titleLarge({Color? color}) => GoogleFonts.tajawal(
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
    height: 1.4,
    color: color,
  );

  static TextStyle titleMedium({Color? color}) => GoogleFonts.tajawal(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    height: 1.3,
    color: color,
  );

  static TextStyle titleSmall({Color? color}) => GoogleFonts.tajawal(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    height: 1.2,
    color: color,
  );

  // ==================== Body Styles ====================

  static TextStyle bodyLarge({Color? color}) => GoogleFonts.tajawal(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: color,
  );

  static TextStyle bodyMedium({Color? color}) => GoogleFonts.tajawal(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    height: 1.4,
    color: color,
  );

  static TextStyle bodySmall({Color? color}) => GoogleFonts.tajawal(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    height: 1.3,
    color: color,
  );

  // ==================== Label Styles ====================

  static TextStyle labelLarge({Color? color}) => GoogleFonts.tajawal(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    height: 1.4,
    color: color,
  );

  static TextStyle labelMedium({Color? color}) => GoogleFonts.tajawal(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    height: 1.3,
    color: color,
  );

  static TextStyle labelSmall({Color? color}) => GoogleFonts.tajawal(
    fontSize: 11.sp,
    fontWeight: FontWeight.w500,
    height: 1.2,
    color: color,
  );

  // ==================== Custom Styles ====================

  static TextStyle button({Color? color}) => GoogleFonts.tajawal(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    color: color,
  );

  static TextStyle caption({Color? color}) => GoogleFonts.tajawal(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    color: color,
  );

  static TextStyle overline({Color? color}) => GoogleFonts.tajawal(
    fontSize: 10.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.5,
    color: color,
  );

  // ==================== Helper Methods ====================

  static TextStyle copyWith(
    TextStyle style, {
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
    TextDecoration? decoration,
    String? fontFamily,
  }) {
    return style.copyWith(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      height: height,
      decoration: decoration,
      fontFamily: fontFamily,
    );
  }

  static TextStyle withUnderline(TextStyle style) {
    return style.copyWith(decoration: TextDecoration.underline);
  }

  static TextStyle withLineThrough(TextStyle style) {
    return style.copyWith(decoration: TextDecoration.lineThrough);
  }

  static TextStyle bold(TextStyle style) {
    return style.copyWith(fontWeight: FontWeight.bold);
  }

  static TextStyle italic(TextStyle style) {
    return style.copyWith(fontStyle: FontStyle.italic);
  }
}
