import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/core/theme/color_manager.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorsManager.backgroundLight,
    fontFamily: "main",
    colorScheme: ColorScheme.light(
      primary: ColorsManager.primaryText,
      primaryContainer: ColorsManager.secondry,
      secondary: ColorsManager.backgroundLight,
      onPrimary: ColorsManager.selection,
      onPrimaryFixed: ColorsManager.secondryText,
      onPrimaryFixedVariant: ColorsManager.thirdColor,
      onPrimaryContainer: Colors.white,
      onSecondary: ColorsManager.primary,
      onSecondaryContainer: Colors.black,
      onSecondaryFixed: const Color(0xFFeeeef0),
      onSecondaryFixedVariant: Colors.white,
      onSurface: Colors.black,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      constraints: BoxConstraints(maxWidth: double.infinity),
    ),
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        fontSize: 17.sp,
        fontWeight: .bold,
        color: Colors.black,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: ColorsManager.backgroundDark,
    fontFamily: "main",
    colorScheme: ColorScheme.dark(
      primary: Colors.white,
      primaryContainer: ColorsManager.secondry,
      secondary: ColorsManager.backgroundDark,
      onPrimary: Colors.white,
      onPrimaryFixed: Colors.white,
      onPrimaryFixedVariant: ColorsManager.primary,
      onPrimaryContainer: Colors.black,
      onSecondary: ColorsManager.thirdColor,
      onSecondaryContainer: Colors.white,
      onSecondaryFixed: ColorsManager.thirdColor,
      onSecondaryFixedVariant: ColorsManager.thirdColor,
      onSurface: ColorsManager.primary,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      constraints: BoxConstraints(maxWidth: double.infinity),
    ),
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        fontSize: 17.sp,
        fontWeight: .bold,
        color: Colors.white,
      ),
    ),
  );
}
