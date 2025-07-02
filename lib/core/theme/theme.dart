import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:office_shopping_mall/core/theme/app_colors.dart';

ThemeData appThemeData() {
  return ThemeData(
    useMaterial3: true,
    textTheme: appTextTheme(),
    colorScheme: appColorScheme(),
    scaffoldBackgroundColor: appColorScheme().background,

    appBarTheme: AppBarTheme(
      elevation: 1,
      surfaceTintColor: appColorScheme().surface,
      shadowColor: appColorScheme().onSurface,
      titleTextStyle: appTextTheme().headlineMedium
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: appColorScheme().primary,
        foregroundColor: appColorScheme().onPrimary,
        textStyle: appTextTheme().bodyLarge,
        minimumSize: Size.fromHeight(48),
      ),
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    ),

    textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom()),

    cardTheme: CardThemeData(
      color: appColorScheme().surface
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: appColorScheme().surfaceContainerLow,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(8.0),
      ),
      labelStyle: appTextTheme().bodyLarge,
      hintStyle: appTextTheme().bodyLarge,
    ),
  );
}

TextTheme appTextTheme() {
  return TextTheme(
    // AppBar 헤드라인 영어
    headlineLarge: GoogleFonts.roboto(
      fontSize: 30,
      color: appColorScheme().onBackground,
      fontWeight: FontWeight.w900,
      fontStyle: FontStyle.italic,
    ),
    // AppBar 헤드라인 한글
    headlineMedium: GoogleFonts.roboto(
      fontSize: 24,
      color: appColorScheme().onSurface,
      fontWeight: FontWeight.w900,
      fontStyle: FontStyle.italic,
    ),
    // 스크린 전체 타이틀
    titleLarge: GoogleFonts.notoSans(fontSize: 24, fontWeight: FontWeight.bold),
    // 카테고리 & 리스트 타이틀
    titleMedium: GoogleFonts.notoSans(fontSize: 22, fontWeight: FontWeight.bold),
    // 기타 볼드체
    titleSmall: GoogleFonts.notoSans(fontSize: 20, fontWeight: FontWeight.bold),
    // 일반 텍스트, 리스트 텍스트 (적은 텍스트)
    bodyLarge: GoogleFonts.notoSans(fontSize: 18, fontWeight: FontWeight.w400),
    // 본문 텍스트 (많은 텍스트)
    bodyMedium: GoogleFonts.notoSans(fontSize: 16, fontWeight: FontWeight.w400),

    labelLarge: GoogleFonts.notoSans(fontSize: 14, fontWeight: FontWeight.w400),
    labelMedium: GoogleFonts.notoSans(fontSize: 12, fontWeight: FontWeight.w400),
  );
}

ColorScheme appColorScheme() {
  return ColorScheme(
    brightness: Brightness.light,

    primary: AppColors.primaryColor,
    onPrimary: AppColors.onPrimaryColor,
    primaryContainer: AppColors.primaryContainerColor,
    onPrimaryContainer: AppColors.onPrimaryColor,

    secondary: AppColors.secondaryColor,
    onSecondary: AppColors.onSecondaryColor,
    secondaryContainer: AppColors.secondaryContainerColor,
    onSecondaryContainer: AppColors.onSecondaryColor,

    tertiary: AppColors.tertiaryColor,
    onTertiary: AppColors.onTertiaryColor,

    background: AppColors.backgroundColor,
    onBackground: AppColors.onBackgroundColor,

    surface: AppColors.surfaceColor,
    onSurface: AppColors.onSurfaceColor,
    surfaceContainerLowest: AppColors.surfaceContainerLowestColor,
    surfaceContainerLow: AppColors.surfaceContainerLowColor,
    surfaceContainer: AppColors.surfaceContainerColor,
    surfaceContainerHigh: AppColors.surfaceContainerHighColor,
    surfaceContainerHighest: AppColors.surfaceContainerHighestColor,
    surfaceVariant: AppColors.surfaceVariantColor,
    onSurfaceVariant: AppColors.onSurfaceVariantColor,

    error: AppColors.red900,
    onError: AppColors.red900,

    outline: AppColors.outlineColor,
    shadow: Colors.black,

    inverseSurface: AppColors.onSurfaceColor,
    inversePrimary: AppColors.primaryContainerColor,
  );
}
