import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:last_exam/utils/constants/colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: AppColors.black,
      ),
      backgroundColor: AppColors.white,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: AppColors.white,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
      elevation: 8,
    ),
    popupMenuTheme: const PopupMenuThemeData(
      elevation: 6,
    ),
    hintColor: Colors.grey,
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: const ColorScheme.light(),
    primaryColorDark: const Color(0xFFCFD5DE),
    primaryColor: const Color(0xFFFFFFFF),
    useMaterial3: true,
    cardColor: Colors.black,
    shadowColor: Colors.grey.shade300,
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
    splashColor: Colors.grey.shade300,
    textTheme: TextTheme(
      displayLarge: TextStyle(color: Colors.black.withOpacity(0.3)),
      displayMedium: TextStyle(color: Colors.black.withOpacity(0.4)),
      displaySmall: TextStyle(color: Colors.black.withOpacity(0.5)),
      headlineMedium: TextStyle(color: Colors.black.withOpacity(0.6)),
      headlineSmall: TextStyle(color: Colors.black.withOpacity(0.7)),
      titleLarge: TextStyle(color: Colors.black.withOpacity(0.8)),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: AppColors.white,
      ),
      backgroundColor: AppColors.black,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: AppColors.black,
      ),
    ),
    popupMenuTheme: const PopupMenuThemeData(
      elevation: 6,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.black,
      elevation: 8,
    ),
    useMaterial3: true,
    splashColor: const Color(0xFF191C1F),
    hintColor: Colors.grey,
    cardColor: Colors.white,
    scaffoldBackgroundColor: AppColors.black,
    colorScheme: const ColorScheme.dark(),
    primaryColorDark: const Color(0xFF536872),
    shadowColor: Colors.grey.shade500,
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.white),
    textTheme: TextTheme(
      displayLarge: TextStyle(color: Colors.white.withOpacity(0.3)),
      displayMedium: TextStyle(color: Colors.white.withOpacity(0.4)),
      displaySmall: TextStyle(color: Colors.white.withOpacity(0.5)),
      headlineMedium: TextStyle(color: Colors.white.withOpacity(0.6)),
      headlineSmall: TextStyle(color: Colors.white.withOpacity(0.7)),
      titleLarge: TextStyle(color: Colors.white.withOpacity(0.8)),
    ),
  );
}
