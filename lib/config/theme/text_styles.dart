import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  AppTextStyles._();

  // ==================== Display Styles ====================
  // للعناوين الرئيسية الكبيرة جداً

  static TextStyle displayLarge({Color? color}) => TextStyle(
    fontSize: 57,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.25,
    height: 1.12,
    color: color,
  );

  static TextStyle displayMedium({Color? color}) => TextStyle(
    fontSize: 45,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.16,
    color: color,
  );

  static TextStyle displaySmall({Color? color}) => TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.22,
    color: color,
  );

  // ==================== Headline Styles ====================
  // للعناوين الرئيسية

  static TextStyle headlineLarge({Color? color}) => TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.25,
    color: color,
  );

  static TextStyle headlineMedium({Color? color}) => TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.29,
    color: color,
  );

  static TextStyle headlineSmall({Color? color}) => TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.33,
    color: color,
  );

  // ==================== Title Styles ====================
  // للعناوين الفرعية والعناصر المهمة

  static TextStyle titleLarge({Color? color}) => TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    height: 1,
    color: color,
  );

  static TextStyle titleMedium({Color? color}) => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    height: 1,
    color: color,
  );

  static TextStyle titleSmall({Color? color}) => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    height: 1,
    color: color,
  );

  // ==================== Body Styles ====================
  // للنصوص العادية والمحتوى

  static TextStyle bodyLarge({Color? color}) => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    height: 1.5,
    color: color,
  );

  static TextStyle bodyMedium({Color? color}) => TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1,
    color: color,
  );

  static TextStyle bodySmall({Color? color}) => TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1,
    color: color,
  );

  // ==================== Label Styles ====================
  // للأزرار والتصنيفات

  static TextStyle labelLarge({Color? color}) => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 1.43,
    color: color,
  );

  static TextStyle labelMedium({Color? color}) => TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    height: 1,
    color: color,
  );

  static TextStyle labelSmall({Color? color}) => TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 1.45,
    color: color,
  );

  // ==================== Custom Styles ====================
  // أنماط مخصصة حسب الحاجة

  static TextStyle button({Color? color}) => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    color: color,
  );

  static TextStyle caption({Color? color}) => TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    color: color,
  );

  static TextStyle overline({Color? color}) => TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.5,
    color: color,
  );

  // ==================== Helper Methods ====================
  // دوال مساعدة لتخصيص النصوص

  /// نسخ النمط مع تعديلات
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

  /// إضافة خط تحت النص
  static TextStyle withUnderline(TextStyle style) {
    return style.copyWith(decoration: TextDecoration.underline);
  }

  /// إضافة خط وسط النص
  static TextStyle withLineThrough(TextStyle style) {
    return style.copyWith(decoration: TextDecoration.lineThrough);
  }

  /// جعل النص بخط عريض
  static TextStyle bold(TextStyle style) {
    return style.copyWith(fontWeight: FontWeight.bold);
  }

  /// جعل النص بخط مائل
  static TextStyle italic(TextStyle style) {
    return style.copyWith(fontStyle: FontStyle.italic);
  }
}

// ==================== استخدام الأمثلة ====================

/// مثال على الاستخدام:
/// 
/// ```dart
/// Text(
///   'عنوان رئيسي',
///   style: AppTextStyles.headlineLarge(color: Colors.blue),
/// )
/// 
/// Text(
///   'نص عادي',
///   style: AppTextStyles.bodyMedium(),
/// )
/// 
/// Text(
///   'نص مع تخصيص',
///   style: AppTextStyles.bold(
///     AppTextStyles.titleMedium(color: Colors.red)
///   ),
/// )
/// 
/// Text(
///   'نص مع خط تحته',
///   style: AppTextStyles.withUnderline(
///     AppTextStyles.bodyLarge()
///   ),
/// )
/// ```

// ==================== Theme Integration ====================

/// دمج مع Theme:
/// 
/// ```dart
/// ThemeData(
///   textTheme: TextTheme(
///     displayLarge: AppTextStyles.displayLarge(),
///     displayMedium: AppTextStyles.displayMedium(),
///     displaySmall: AppTextStyles.displaySmall(),
///     headlineLarge: AppTextStyles.headlineLarge(),
///     headlineMedium: AppTextStyles.headlineMedium(),
///     headlineSmall: AppTextStyles.headlineSmall(),
///     titleLarge: AppTextStyles.titleLarge(),
///     titleMedium: AppTextStyles.titleMedium(),
///     titleSmall: AppTextStyles.titleSmall(),
///     bodyLarge: AppTextStyles.bodyLarge(),
///     bodyMedium: AppTextStyles.bodyMedium(),
///     bodySmall: AppTextStyles.bodySmall(),
///     labelLarge: AppTextStyles.labelLarge(),
///     labelMedium: AppTextStyles.labelMedium(),
///     labelSmall: AppTextStyles.labelSmall(),
///   ),
/// )
/// ```