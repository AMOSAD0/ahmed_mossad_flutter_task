import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF0079FE);
  static const Color secondaryColor = Color(0xFF252525);
  static const Color backgroundLight = Color(0xFFFFFFFF);

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundLight,

    textTheme: GoogleFonts.tajawalTextTheme(),

    appBarTheme: AppBarTheme(
      backgroundColor: secondaryColor,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 20.sp,
      ),
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
    ),

    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      background: backgroundLight,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onBackground: Colors.black,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.r)),
        borderSide: BorderSide(color: primaryColor, width: 2.w),
      ),
      labelStyle: const TextStyle(color: secondaryColor),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        textStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
      ),
    ),
  );
}
