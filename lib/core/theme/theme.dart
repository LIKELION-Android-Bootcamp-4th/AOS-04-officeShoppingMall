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
      scrolledUnderElevation: 1,
      surfaceTintColor: appColorScheme().surface,
      backgroundColor: appColorScheme().surface,
      shadowColor: appColorScheme().onSurface,
      titleTextStyle: appTextTheme().headlineMedium,
    ),

    tabBarTheme: TabBarThemeData(
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: appColorScheme().tertiary,
      ),
      indicatorSize: TabBarIndicatorSize.tab,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      dividerColor: Colors.transparent,
      labelColor: appColorScheme().onBackground,
      unselectedLabelColor: appColorScheme().onBackground,
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

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: appTextTheme().bodyMedium,
        backgroundColor: Colors.transparent,
      ),
    ),

    cardTheme: CardThemeData(color: appColorScheme().surface),

    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) return appColorScheme().surface;
        return appColorScheme().surfaceContainerHigh;
      }),
      trackColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) return appColorScheme().primary;
        return appColorScheme().surfaceContainerLow;
      }),
    ),

    dividerTheme: DividerThemeData(color: appColorScheme().outline),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: appColorScheme().surfaceContainerLow,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(8.0),
      ),
      labelStyle: appTextTheme().bodySmall,
      hintStyle: appTextTheme().labelLarge,
    ),

    dialogTheme: DialogThemeData(backgroundColor: appColorScheme().surface),
  );
}

TextTheme appTextTheme() {
  return TextTheme(
    // 인증 화면 앱 로고
    displayLarge: GoogleFonts.roboto(
      fontSize: 84,
      color: appColorScheme().onBackground,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.italic,
    ),
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
      color: appColorScheme().onBackground,
      fontWeight: FontWeight.w900,
    ),
    headlineSmall: GoogleFonts.roboto(
      fontSize: 22,
      color: appColorScheme().onBackground,
      fontWeight: FontWeight.w700,
    ),
    // 스크린 전체 타이틀
    titleLarge: GoogleFonts.notoSans(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    ),
    // 카테고리 & 리스트 타이틀
    titleMedium: GoogleFonts.notoSans(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    ),
    // 기타 볼드체
    titleSmall: GoogleFonts.notoSans(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    ),
    // 일반 텍스트, 리스트 텍스트 (적은 텍스트)
    bodyLarge: GoogleFonts.notoSans(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: Colors.black87,
    ),
    // 본문 텍스트 (많은 텍스트)
    bodyMedium: GoogleFonts.notoSans(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.black87,
    ),

    labelLarge: GoogleFonts.notoSans(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.black45,
    ),
    labelMedium: GoogleFonts.notoSans(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Colors.black45,
    ),
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
    outlineVariant: AppColors.outlineVariantColor,
    shadow: Colors.black,

    inverseSurface: AppColors.onSurfaceColor,
    inversePrimary: AppColors.primaryContainerColor,
  );
}
